# frozen_string_literal: true

# require_relative 'operations/attachments/create'

module PolyPress

  # A Resource is keyed references to local content -- such as images -- embedded
  #  at the Composition location
  class Resource < Dry::Struct

    attribute :key,     Types::Symbol.meta(omittable: false)
    attribute :ref,     Types::Any.meta(omittable: false)

  end

end
