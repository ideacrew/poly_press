# frozen_string_literal: true

require 'dry-types'

module PolyPress
  module Types
    send(:include, Dry.Types())
    include Dry::Logic


    Formatter         = Types::Coercible::String.default("csv").enum("csv", "pdf", "text", "xml", "json")

    HashOrNil         = Types::Hash | Types::Nil
    StringOrNil       = Types::String | Types::Nil

    RequiredString    = Types::Strict::String.constrained(min_size: 1)
    StrippedString    = Types::String.constructor(&:strip)
    SymbolOrString    = Types::Symbol | Types::String
    NilOrString       = Types::Nil | Types::String

    StrictSymbolizingHash = Types::Hash.schema({}).strict.with_key_transform(&:to_sym)

    Callable   = Types.Interface(:call)

  end
end
