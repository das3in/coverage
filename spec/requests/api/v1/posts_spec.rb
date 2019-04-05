require "rails_helper"

describe "GET /api/v1/posts" do
  pending it "should return all non-draft posts" do
    create(:post, :with_thumbnail)
    create(:post, :with_thumbnail)
    create(:post, :with_thumbnail)

    get "/api/v1/posts",
      headers: json_headers,
      as: :json

    expect(Post.count).to eq(3)
  end
end
