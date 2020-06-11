# frozen_string_literal: true

Dry::Validation.load_extensions(:monads)

module PolyPress
  module Validations

    # Configuration values and shared rules and macros for domain model validation contracts
    class ApplicationContract < Dry::Validation::Contract
      config.messages.default_locale = :en
      config.messages.backend = :i18n

      # an array of files paths that are used to load messages
      config.messages.load_paths = []
      
      # config.messages.top_namespace - the key in the locale files under which messages are defined, by default it's dry_validation
      # config.messages.namespace - custom messages namespace for a contract class. Use this to differentiate common messages

# TODO Uncomment Rules below and add nested validations 
      # @!macro ruleeach
      #   Validates a nested array of $0 params
      #   @!method rule(settings)
      # rule(:tags).each do
      #   if key? && value
      #     result = CallCenter::Validation::TagContract.new.call(value)
      #     # Use dry-validation metadata error form to pass error hash along with text to calling service
      #     key.failure(text: "invalid tags", error: result.errors.to_h) if result && result.failure?
      #   end
      # end

      # rule(:phone_config) do
      #   if key? && value
      #     result = CallCenter::Validation::PhoneConfigContract.new.call(value)
      #     # Use dry-validation metadata error form to pass error hash along with text to calling service
      #     key.failure(text: "invalid phone_config", error: result.errors.to_h) if result && result.failure?
      #   end
      # end

      # rule(:identity_info) do
      #   if key? && value
      #     result = CallCenter::Validation::IdentityInfoContract.new.call(value)
      #     # Use dry-validation metadata error form to pass error hash along with text to calling service
      #     key.failure(text: "invalid identity_info", error: result.errors.to_h) if result && result.failure?
      #   end
      # end


    end
  end
end
