# frozen_string_literal: true

require_relative 'operations/templates/list'
require_relative 'operations/templates/create'
require_relative 'operations/templates/update'
require_relative 'operations/templates/find'
# require_relative 'operations/templates/delete'

module PolyPress

  # A Template contains structured and unstructured text and associated content to be output into a document
  class Template < Dry::Struct

    attribute :key,               Types::Symbol.meta(omittable: false) # unique identifier
    attribute :title,             Types::String.meta(omittable: false) # human name for display purposes
    attribute :entity_class_name, Types::String.meta(omittable: false) # Application entity 
    attribute :namespace,         Types::Array.of(PolyPress::Namespace).meta(omittable: true) # unique identifier
    attribute :token_set,         Types::Array.of(Types::Symbol).meta(omittable: true) # cached list of substitution attributes used in the composition
    attribure :compositions,      Types::Array.of(PolyPress::Composition).meta(omittable: true)
    attribute :options,           Types::Array.of(PolyPress::Option).meta(omittable: true)  # settings passed into the formatter(s) to build documents 

  end
end