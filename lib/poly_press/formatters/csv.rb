# frozen_string_literal: true

module PolyPress
  module Formatters

    class Csv
      send(:include, Dry::Monads[:result, :do])

      # @param[Dry::Struct] content (required)
      # @return [Dry::Monad::Result<PolyPress::Document>] document
      def call(content:)

        output  = yield format(content)

        Success(output)
      end

      private

      def format(content)

        # Infer column types from the first item in the array
        klass = items.first.class
        columns = content.map(&:name)

        Try {
          CSV.generate do |csv|
            csv << columns.map { |column| klass.human_attribute_name(column) }
            items.each do |item|
              csv << columns.map do |column|
                column == 'tags' ? item.tags.join(' ') : item.send(column)
              end
            end
          end
        }.to_result

      end

    end
  end
end
