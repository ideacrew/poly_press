# frozen_string_literal: true

module PolyPress

  class RecordArrayStruct < Dry::Struct

    attribute :header,    PolyPress::Types::Array.of(PolyPress::Types::String).meta(omittable: true)
    attribute :records,   PolyPress::Types::Array do
      attribute :record,  PolyPress::Types::Array.of(PolyPress::Types::Any).meta(omittable: false)
    end

  end
end
