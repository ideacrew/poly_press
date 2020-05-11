# frozen_string_literal: true

# require_relative 'operations/options/create'

module PolyPress

  # An Option os a key/value pair 
  class Option < Dry::Struct

    attribute :key,   Types::Symbol.meta(omittable: false)
    attribute :value, Types::Any.meta(omittable: false)

  end

end