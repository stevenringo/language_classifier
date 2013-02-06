module Classifier
  class Scorer
    def self.calculate_score(category_profile, document_profile)
      score = 0
      document_profile.each_with_index do |ngram, i|
        category_profile_position = category_profile.index(ngram) || -1 # if not found
        if category_profile_position >= 0
          element_score = (category_profile_position - i).abs
        else
          element_score = 300
        end
        score += element_score
      end
      score
    end
  end
end
