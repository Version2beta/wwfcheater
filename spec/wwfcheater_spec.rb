require_relative '../wwfcheater'

describe WWFCheater do
  it "initializes with a dictionary if one is provided" do
    cheater = WWFCheater.new File.dirname(__FILE__) + "/support/words.txt"
    cheater.dictionary.length.should > 0
  end
  it "initializes with a default dictionary if none is provided" do
    cheater = WWFCheater.new
    cheater.dictionary.length.should > 0
  end
  it "recognizes a match between a word and some tiles" do
    cheater = WWFCheater.new
    cheater.match?("was", "swyaer").should be_true
  end
  it "recognizes a mismatch between a word and some tiles" do
    cheater = WWFCheater.new
    cheater.match?("was", "swyer").should be_false
  end
  it "returns an array of matches" do
    cheater = WWFCheater.new File.dirname(__FILE__) + "/support/words.txt"
    cheater.matches("saw").should == ["a\n", "was\n", "as\n", "saw\n"]
  end
end

