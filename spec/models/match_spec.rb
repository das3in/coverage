require "rails_helper"

describe Match do
  context "associations" do
    it { should have_many(:points) }
  end
end
