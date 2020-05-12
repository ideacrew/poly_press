# frozen_string_literal: true

require 'spec_helper'
require 'support/poly_press_data_seed'

RSpec.describe PolyPress::Formatters::Csv do
  include PolyPressDataSeed


  context "Params passed in array form" do
    context "with a header record" do
      let(:x_files_people) { x_files_array_with_header_struct }

      it "should do something"
    end

    context "without a header record" do
      let(:x_files_people) { x_files_array_struct }


      it "should do something"
    end
  end

  context "Params passed in hash form" do
    let(:x_files_people)  { x_files_hash_struct }
    let(:csv_out)         {
      "FirstName,LastName,Age,Gender\n" +
      "fox,mulder,35,male\n" +
      "jeffrey,spender,25,male\n" +
      "dana,scully,31,female\n" +
      "walter,skinner,40,male\n" +
      "samantha,skully,12,female\n" +
      "alex,krychek,33,male\n" +
      "smoking,man,64,male\n" +
      "john,doggett,38,male\n"
    }

    it "should generate csv header and rows for each record" do
      result = subject.call(content: x_files_people)

      expect(result.success?).to be_truthy
      expect(result.value!).to eq csv_out
    end
  end

end
