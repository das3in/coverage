require "rails_helper"

describe PickemGuess do
  context "associations" do
    it { should belong_to(:pickem) }
    it { should belong_to(:match) }
    it { should belong_to(:pickem_player) }
    it { should belong_to(:guess) }
  end
end
