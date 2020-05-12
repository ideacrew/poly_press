# frozen_string_literal: true

module PolyPressDataSeed
  class RecordHashStruct  < Dry::Struct

    attribute :list,  PolyPress::Types::Array.of(PolyPress::Types::Hash).meta(omittable: false)

  end
end
