require 'spec_helper'
require_relative "../../lib/classifier/profiler"

describe Classifier::Profiler do
  it "returns a document profile of ngrams as an array ordered by frequency of ngram" do
    ngrams = { "and" => 2, "ed" => 1, "er" => 4, "ing" => 10, "on" => 5, "th" => 100 }
    document_profile = Classifier::Profiler.document_profile(ngrams)
    document_profile.should =~ ["th", "ing", "on", "er", "and", "ed"]
  end
end
