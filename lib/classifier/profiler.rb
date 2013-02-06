module Classifier
  class Profiler
    def self.document_profile(ngrams)
      ngrams.sort { |x,y| y[1] <=> x[1] }.map { |i| i[0] }
    end
  end
end
