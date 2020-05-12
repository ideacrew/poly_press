# frozen_string_literal: true

module PolyPressDataSeed

  class RecordHashStruct  < Dry::Struct

    attribute :records,   PolyPress::Types::Array do
      attribute :record,  PolyPress::Types::Hash.meta(omittable: false)
    end

  end
end
