# frozen_string_literal: true

require_relative 'operations/documents/create'

module PolyPress

  HTML_FORMATTER = lambda do |context|
  end

  PDF_FORMATTER  = lambda do |context|
  end

  EDI_834_FORMATTER = {}

  JSON_FORMATTER = lambda do |context|
  end

  TEXT_FORMATTER = lambda do |context|
    puts("*** #{context.title} ***")
    context.text.each { |line| puts "#{line}\n" }
  end

  XML_FORMATTER = lambda do |context|
  end

  class Document < Dry::Struct

    attribute :document

  end

end