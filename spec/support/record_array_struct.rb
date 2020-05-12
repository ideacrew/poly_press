# frozen_string_literal: true

module PolyPressDataSeed

  class RecordArrayStruct < Dry::Struct

    attribute :header,  PolyPress::Types::Array.of(PolyPress::Types::String).meta(omittable: true)
    attribute :list, PolyPress::Types::Array.of(PolyPress::Types::Any).meta(omittable: false)

  end
end
