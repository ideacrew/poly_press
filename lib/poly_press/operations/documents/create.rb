# frozen_string_literal: true

module PolyPress
  module Operations
    module Documents

      # Generate a {Document} using the entity instance values with {Template} composition 
      #  in the Format and Locale
      class Create
        send(:include, Dry::Monads[:result, :do])
        send(:include, Dry::Monads[:try])

        # @param[Dry::Struct] entity_instance (required)
        # @param[Symbol] formatter (required)
        # @param[Symbol] template_key
        # @param[String] locale
        # @return [Dry::Monad::Result<PolyPress::Document>] document
        def call(params)
          values          = yield validate(params)
          content         = yield merge(values)
          formatter_klass = yield formatter_class(values.to_h[:formatter])
          document        = yield create(formatter_klass: formatter_klass, content: content)

          Success(document)
        end

        private

        def validate(params)
          PolyPress::Validations::CreateDocumentContract.new(params)
        end

        def merge(values)
          values_hash = values.to_h

          template = Operations::Templates::Find.new.call(key: values_hash[:template_key], locale: values_hash[:locale])
          template.new.call(values: values_hash[:entity_instance]).to_result
        end

        def formatter_klass(formatter)
          Try { ("PolyPress::Formatters::" + "#{formatter}.classify").constantize }.to_result
        end

        def create(formatter_klass, content)
          document = formatter_klass.new.call(content)

          Success(document)
        end

      end
    end
  end
end
