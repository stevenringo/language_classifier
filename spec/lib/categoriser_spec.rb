require 'spec_helper'
require_relative "../../lib/classifier/categoriser"
require_relative "../../lib/classifier/sanitiser"
require_relative "../../lib/classifier/ngram_extractor"
require_relative "../../lib/classifier/profiler"
require_relative "../../lib/classifier/scorer"

describe Classifier::Categoriser do
  it { determines_language_for("english") }
  it { determines_language_for("italian") }
  it { determines_language_for("german") }
  it { determines_language_for("french") }
  it { determines_language_for("dutch") }
  it { determines_language_for("scots") }
  it { determines_language_for("spanish") }

  def determines_language_for(language)
    document = File.read(File.expand_path("../../fixtures/#{language}.txt", __FILE__))
    Classifier::Categoriser.new(document).determine_language.should == language
  end
end
