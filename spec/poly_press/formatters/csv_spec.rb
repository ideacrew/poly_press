# frozen_string_literal: true

require 'spec_helper'
require 'support/poly_press_data_seed'

RSpec.describe PolyPress::Formatters::Csv do
  include PolyPressDataSeed


  context "Params passed in array form" do
    context "with a header record" do
      it "should do something"

    end

    context "without a header record" do
      it "should do something"
    end
  end

  context "Params passed in hash form" do
    it "should do something"
  end


end
