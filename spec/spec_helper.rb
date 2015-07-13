require 'factory_girl'
require 'factory_girl_rails'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :mocha
end

module InitializationHelper
  def login(user)
    session[:user_id] = user.id
  end
end
