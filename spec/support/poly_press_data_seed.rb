# frozen_string_literal: true

require_relative 'record_array_struct'
require_relative 'record_hash_struct'

module PolyPressDataSeed

  def x_files_header
    %w(first_name last_name age gender)
  end


  def x_files_rows
    [
      %w(fox mulder 35 male),
      %w(jeffrey spender 25 male),
      %w(dana scully 31 female),
      %w(walter skinner 40 male),
      %w(samantha mulder 12 female),
      %w(alex krychek 33 male),
      %w(smoking man 64 male),
      %w(john doggett 38 male),
    ]
  end


  def x_files_hash
    [
      {first_name: "fox", last_name: "mulder", age: 35, gender: "male"},
      {first_name: "jeffrey", last_name: "spender", age: 25, gender: "male"},
      {first_name: "dana", last_name: "scully", age: 31, gender: "female"},
      {first_name: "walter", last_name: "skinner", age: 40, gender: "male"},
      {first_name: "samantha", last_name: "skully", age: 12, gender: "female"},
      {first_name: "alex", last_name: "krychek", age: 33, gender: "male"},
      {first_name: "smoking", last_name: "man", age: 64, gender: "male"},
      {first_name: "john", last_name: "doggett", age: 38, gender: "male"},
    ]
  end

  def x_files_array_struct
    RecordArrayStruct.new(list: x_files_rows)
  end

  def x_files_array_with_header_struct
    RecordArrayStruct.new(header: x_files_header, list: x_files_rows)
  end

  def x_files_hash_struct
    RecordHashStruct.new(list: x_files_hash)
  end

end
