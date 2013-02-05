module Classifier
  class Sanitiser
    def self.keep_alphanumerics_and_spaces(text)
      text.gsub(%r([^a-zA-Z ]), "")
    end
    def self.replace_spaces(text)
      text.gsub!(/ /,"_")
    end
    def self.prepare(text)
      replace_spaces(keep_alphanumerics_and_spaces(text)).downcase!
    end
  end
end
