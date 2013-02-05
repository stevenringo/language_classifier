module Classifier
  class NGramExtractor
    attr_accessor :text
    def initialize(text)
      @text = text
    end

    def bigrams
      ngrams(2)
    end

    def trigrams
      ngrams(3)
    end

    def ngrams(n)
      n_grams = Hash.new(0)
      (text.length - n).times do |i|
        current_ngram = text[i..i+n-1]
        n_grams[current_ngram] += 1
      end
      n_grams
    end

    def ngrams_for_categorisation
      ngrams = {}
      (1..4).each do |n|
        ngrams.merge!(ngrams(n))
      end
      ngrams
    end
  end
end
