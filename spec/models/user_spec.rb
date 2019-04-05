require "rails_helper"

describe User do
  context "associations" do
    it { should have_many(:microposts) }
    it { should have_many(:posts) }
    it { should have_many(:pickem_players) }
    it { should have_many(:pickems) }
  end

  describe "#display_name" do
    it "should display the first and last name with a space" do
      user = create(:user, first_name: "John", last_name: "Smith")

      expect(user.display_name).to eq("John Smith")
    end
  end
end
