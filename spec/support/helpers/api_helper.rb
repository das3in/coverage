module ApiHelper
  def auth_headers(user = create(:user))
    json_headers.merge("Authorization" => "Bearer #{user.authentication_token}")
  end

  def json_headers
    {
      "Accept" => "application/json",
      "Content-Type" => "application/json",
    }
  end

  def response_json
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include ApiHelper, type: :request
end
