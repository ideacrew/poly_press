# frozen_string_literal: true

# require_relative 'operations/document/create'

module PolyPress

  # A Template contains structured and unstructured text and associated content to be output into a document
  class Composition < Dry::Struct

    attribute :content,   Types::String.meta(omittable: true) # Literal text with embedded markdown 
    attribute :locale,    Types::String.meta(omittable: false) # Composition's written Language
    attribute :resources, Types::Array.of(PolyPress::Resource).meta(omittable: true)

  end

end