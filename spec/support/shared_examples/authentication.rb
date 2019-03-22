RSpec.shared_examples "authenticated endpoint" do |method, path|
  context "with invalid authentication token" do
    it "returns a forbidden status" do
      public_send(
        method.downcase,
        path,
        headers: json_headers.merge("Authorization" => "Bearer invalid_token")
      )

      expect(response.status).to eq(403)
    end
  end
end
