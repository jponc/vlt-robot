RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    RSpec.configuration.user = create(:user)
    RSpec.configuration.other_company = FactoryGirl.create(:company)
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :mocha
end

module InitializationHelper
  def login
    @user = RSpec.configuration.user
    session[:user_id] = @user.id
  end
end
