module Classifier
  class Scorer
    def self.calculate_score(language_profile, document_profile)
      score = 0
      document_profile.each_with_index do |ngram, i|
        language_profile_position = language_profile.index(ngram) || -1 # if not found
        if language_profile_position >= 0
          element_score = (language_profile_position - i).abs
        else
          element_score = 300
        end
        score += element_score
      end
      score
    end
  end
end
