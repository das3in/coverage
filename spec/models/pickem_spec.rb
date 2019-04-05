require "rails_helper"

describe Pickem do
  context "associations" do
    it { should belong_to(:tournament) }
    it { should have_many(:pickem_players) }
    it { should have_many(:users) }
  end
end
