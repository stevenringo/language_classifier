require 'spec_helper'
require_relative "../../lib/classifier/scorer"

describe Classifier::Scorer do
  it "calculates a score using the out-of-place measure between two document profiles" do
    document_profile = [ "_", "e", "o", "t", "n", "s", "a", "i", "r", "c", "d", "u", "l", "_a", "m", "h", "s_", "f", "d_", "in", "e_", "an", "th", "g", "n_", ]
    language_profile = [ "_", "e", "t", "o", "n", "i", "a", "s", "r", "h", "e_", "d", "_t", "c", "l", "th", "he", "_th", "u", "f", "m", "p", "_a", "the", "_the" ]

    score = Classifier::Scorer.calculate_score(language_profile, document_profile)
    score.should == 1860
  end
  it "calculates a score of 0 for identical document and language profiles" do
    document_profile = [ "_", "e", "o", "t", "n"]
    language_profile = [ "_", "e", "o", "t", "n"]

    score = Classifier::Scorer.calculate_score(language_profile, document_profile)
    score.should == 0
  end
  it "calculates a score of 2 for two elements out of place" do
    document_profile = [ "_", "p", "e", "o", "t", "n"]
    language_profile = [ "_", "e", "p", "o", "t", "n"]

    score = Classifier::Scorer.calculate_score(language_profile, document_profile)
    score.should == 2
  end
  it "calculates a score of 300 for document element not found in the language profile" do
    document_profile = [ "_", "p", "e", "o", "t", "n"]
    language_profile = [ "_", "p", "e", "o", "t"]

    score = Classifier::Scorer.calculate_score(language_profile, document_profile)
    score.should == 300
  end

  it "calculates a score of 0 for when all the document elements are in the language profile" do
    document_profile = [ "_", "p", "e", "o", "t"]
    language_profile = [ "_", "p", "e", "o", "t", "n"]

    score = Classifier::Scorer.calculate_score(language_profile, document_profile)
    score.should == 0
  end
end

