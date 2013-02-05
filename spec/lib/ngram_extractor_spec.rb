require 'spec_helper'
require_relative "../../lib/classifier/ngram_extractor"

describe Classifier::NGramExtractor do
  let(:ngram) { Classifier::NGramExtractor.new("How much wood would a woodchuck chuck") }
  it "creates bigrams" do
    ngram.bigrams.should == {
                              "Ho" => 1, "ow" => 1, "w " => 1, " m" => 1, "mu" => 1,
                              "uc" => 3, "ch" => 3, "h " => 1, " w" => 3, "wo" => 3,
                              "oo" => 2, "od" => 2, "d " => 2, "ou" => 1, "ul" => 1,
                              "ld" => 1, " a" => 1, "a " => 1, "dc" => 1, "hu" => 2,
                              "ck" => 1, "k " => 1, " c" => 1
                            }
  end

  it "creates trigrams" do
    ngram.trigrams.should == {
                               "How" => 1, "ow " => 1, "w m" => 1, " mu" => 1,
                               "muc" => 1, "uch" => 1, "ch " => 1, "h w" => 1,
                               " wo" => 3, "woo" => 2, "ood" => 2, "od " => 1,
                               "d w" => 1, "wou" => 1, "oul" => 1, "uld" => 1,
                               "ld " => 1, "d a" => 1, " a " => 1, "a w" => 1,
                               "odc" => 1, "dch" => 1, "chu" => 2, "huc" => 2,
                               "uck" => 1, "ck " => 1, "k c" => 1, " ch" => 1
                             }
  end

  it "creates quadgrams" do
    ngram.ngrams(4).should == {
                                "How " => 1, "ow m" => 1, "w mu" => 1, " muc" => 1,
                                "much" => 1, "uch " => 1, "ch w" => 1, "h wo" => 1,
                                " woo" => 2, "wood" => 2, "ood " => 1, "od w" => 1,
                                "d wo" => 1, " wou" => 1, "woul" => 1, "ould" => 1,
                                "uld " => 1, "ld a" => 1, "d a " => 1, " a w" => 1,
                                "a wo" => 1, "oodc" => 1, "odch" => 1, "dchu" => 1,
                                "chuc" => 2, "huck" => 1, "uck " => 1, "ck c" => 1,
                                "k ch" => 1, " chu" => 1
                              }
  end
  it "creates all ngrams for text categorisation" do
    ngrams_for_categorisation = ngram.ngrams_for_categorisation
    ngrams_for_categorisation.should == ngram.ngrams(1).merge(ngram.ngrams(2)).merge(ngram.ngrams(3)).merge(ngram.ngrams(4))
  end

end

