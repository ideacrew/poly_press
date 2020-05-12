# frozen_string_literal: true
require 'csv'

module PolyPress
  module Formatters

    class Csv
      send(:include, Dry::Monads[:result, :do])
      send(:include, Dry::Monads[:try])

      # @param[Dry::Struct] content (required)
      # @return [Dry::Monad::Result<PolyPress::Document>] document
      def call(content:)

        output  = yield format(content)

        Success(output)
      end

      private

      def format(content)

        # klass = content.class
        columns = content[:list].first.keys

        Try {
          CSV.generate do |csv|
            csv << columns.map { |column| camelize(column) }
            content[:list].each do |item|
              csv << columns.map do |column|
                column == :tags ? item[:tags].join(' ') : item[column]
              end
            end
          end
        }.to_result

      end


      def camelize(string)
        string = string.to_s.sub(/^[a-z\d]*/) { |match| match.capitalize }
        string.gsub(/(?:_|(\/))([a-z\d]*)/) { "#{$1}#{$2.capitalize}" }.gsub("/", "::")
      end

    end
  end
end
