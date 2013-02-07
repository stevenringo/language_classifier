require_relative "sanitiser"
require_relative "ngram_extractor"
require_relative "profiler"
require_relative "scorer"

module Classifier
  class Categoriser
    def initialize(document)
      @document_profile = get_document_profile(document)
    end

    def score_for(language)
      language_profile = load_language_profile(language)
      Classifier::Scorer.calculate_score(language_profile, @document_profile)
    end

    def determine_language
      languages = Dir.chdir("data/language_profiles") { Dir["*.lm"] }.map { |file| File.basename(file, ".lm") }
      scores = languages.inject({}) { |hash, language| hash.merge(language => score_for(language)) }
      scores.sort { |x,y| x[1] <=> y[1] }.map { |el| el.first }.first
    end

    private

    def get_document_profile(document)
      sanitised_document = Classifier::Sanitiser.prepare(document)
      ngram_extractor = Classifier::NGramExtractor.new(sanitised_document)
      ngrams = ngram_extractor.ngrams_for_categorisation
      Classifier::Profiler.document_profile(ngrams)
    end

    def load_language_profile(language)
      language_profile_lines = File.readlines(File.expand_path("../../../data/language_profiles/#{language}.lm", __FILE__))
      language_profile_lines.map { |line| line.gsub(/\s.*$/,"") }
    end
  end
end
