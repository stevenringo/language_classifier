require 'spec_helper'
require_relative "../../lib/classifier/scorer"

describe Classifier::Scorer do
  it "calculates a score using the out-of-place measure between two document profiles" do
    document_profile = [ "_", "e", "o", "t", "n", "s", "a", "i", "r", "c", "d", "u", "l", "_a", "m", "h", "s_", "f", "d_", "in", "e_", "an", "th", "g", "n_", ]
    category_profile = [ "_", "e", "t", "o", "n", "i", "a", "s", "r", "h", "e_", "d", "_t", "c", "l", "th", "he", "_th", "u", "f", "m", "p", "_a", "the", "_the" ]

    score = Classifier::Scorer.calculate_score(category_profile, document_profile)
    score.should == 1860
  end
end

