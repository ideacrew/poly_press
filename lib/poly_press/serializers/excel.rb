require 'rubyXL'
require 'rubyXL/convenience_methods/cell'

module PolyPress
  module Serializers

    class Excel
      send(:include, Dry::Monads[:result, :do])
      send(:include, Dry::Monads[:try])

      DATA_FEATURE_KEYS = %w(sheet row_group row cells checkboxes)
      DERIVED_INPUT_KINDS = %w(checkboxes)


      # @param[Dry::Struct] data (required)
      # @param[String] form_namespace (required)
      # @param[Dry::Container] registry
      # @return [Dry::Monad::Result<PolyPress::Document>] document
      def call(data:, form_namespace:, registry:)
        template        = yield get_template(registry, form_namespace)
        data_features   = yield get_data_features(registry, form_namespace)
        document        = yield create(data, template, data_features, form_namespace)

        Success(document)
      end

      private

      def get_template(registry, form_namespace)
        form_name = form_namespace.split('.')[-1]
        template_feature = [form_name, 'template'].join('_')
        template = registry[template_feature].item

        Success(template)
      end

      def get_data_features(registry, form_namespace)
        data_features = registry.features_by_namespace(form_namespace).collect do |feature_key|
          feature = registry[feature_key]
          feature if DATA_FEATURE_KEYS.include?(feature.item.to_s)
        end.compact
  
        Success(data_features)
      end

      def create(data, template, data_features, form_namespace)
        sheet = data_features.detect{|feature| feature.item == :sheet}

        workbook = RubyXL::Parser.parse(template)

        sheet.setting(:data_elements).item.each do |index, elements|
          form_name = form_namespace.split('.')[-1]
          features = data_features.select{|feature| elements.include?(feature.key.to_sym) }

          worksheet = workbook[index]

          # process row_group & row first
          cell_features = features.select{|feature| feature.item == :cells}
          derived_features = features.select{|feature| DERIVED_INPUT_KINDS.include?(feature.item.to_s) }
          
          cell_features.each do |feature|
          	if matched = feature.key.to_s.match(/^#{form_name}_(.*)$/)
          	  feature_data = data.send(matched[1]) rescue data
            end
            worksheet = populate_cells(worksheet, feature_data || data, feature, derived_features)
          end
        end

        file = workbook.write('tmp/form_301_test.xlsx')

        Success(file)
      end

      def populate_cells(worksheet, data, feature, derived_features)

        feature.settings.each do |setting|

          if value = fetch_value(setting.key.to_s, data)

          	value = parse_dates(value)

          	if setting.item.is_a?(Hash)
          	   setting_location = setting.item
      	    else
      	  	   derived_input_keys = setting.item.split('.')
      	  	   derived_feature  = derived_features.detect{|feature| feature.item == derived_input_keys[0].to_sym }
      	  	   setting = derived_feature.setting(derived_input_keys[1..-1].join('.'))
      	  	   setting_location = setting.item[(boolean?(value) ? value : value.to_sym)]
      	  	   if derived_feature.item == :checkboxes
      	  	     value = 'X'
      	  	   end
            end

            points = setting_location[:cell]

          	worksheet.sheet_data[points[0]][points[1]].change_contents(value)
      	  end
        end

        worksheet
      end

      def fetch_value(attribute, data)
        attributes = attribute.split('.')

        if attributes.count > 1
          fetch_value(attributes[1..-1].join('.'), data.send(attributes[0]))
        else
          data.send(attributes[0])
        end
      end

      def boolean?(value)
    	value.is_a?(TrueClass) || value.is_a?(FalseClass) 
      end

      def parse_dates(value)
      	if value.is_a?(Date)
      	  value.strftime('%m/%d/%Y')
      	elsif value.is_a?(DateTime)
      	  value
      	else
      	  value
      	end
      end

    end
  end
end
