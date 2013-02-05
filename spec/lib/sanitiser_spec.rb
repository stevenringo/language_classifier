require 'spec_helper'
require_relative "../../lib/classifier/sanitiser"

describe Classifier::Sanitiser do
  it "removes punctuation and non-alpha characters" do
    text = "Electronic documents, come from a wide variety of sources: the internet, and others"
    sanitised = Classifier::Sanitiser.prepare(text)
    sanitised.should == "electronic_documents_come_from_a_wide_variety_of_sources_the_internet_and_others"
  end
end

