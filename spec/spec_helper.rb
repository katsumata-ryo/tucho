require 'simplecov'
require 'rspec/request_describer'
require 'devise'
include Warden::Test::Helpers

SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include RSpec::RequestDescriber , type: :request
  config.include Devise::TestHelpers, type: :requests
  # config.include Capybara::DSL
end
