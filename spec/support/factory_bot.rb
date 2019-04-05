FactoryBot.use_parent_strategy = true

FactoryBot::SyntaxRunner.class_eval do
  include ActionDispatch::TestProcess
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
