# frozen_string_literal: true

module PolyPress
  module Validations

    # Schema and validation rules for the {PolyPress::Operations::Documents::Create} operation
    class CreateDocumentContract < ApplicationContract

      # @!method call(opts)
      # @param [Hash] opts the parameters to validate using this contract
      # @option opts [Dry::Struct] :entity_instance (required)
      # @option opts [PolyPress::Types::Formatter] :formatter (required)
      # @option opts [Symbol] :template_key
      # @option opts [Symbol] :locale
      # @return [Dry::Monads::Result] result
      params do
        required(:entity_instance).filled(Dry::Struct)
        required(:formatter).filled(PolyPress::Types::Formatter)
        optional(:template_key).value(:symbol)
        optional(:locale).value(:string)

        # @!macro [attach] beforehook
        #   @!method $0($1)
        #   Coerce locale string value if present
        before(:value_coercer) do |result|
          result.to_h.merge!({ locale: config.messages.default_locale }) if (result[:locale].nil? || result[:locale].empty?)
        end
      end

      # Template key must exist and use the same entity class
      rule(:template_key) do
        if key? && value
          param_class = value[:entity_instance].class.name
          expected_class = Operations::Templates.find.new.call(key)
          key.failure(text: "template not found: #{key}") if (result[:template_key].nil? || result[:template_key].empty?)
          key.failure(text: "feature #{expected_class} expected, got #{param_class}", error: result.errors.to_h) if expected_class != param_class
        end
      end


      # Template for locale must exist
      rule(:locale) do
      end

    end
  end
end
