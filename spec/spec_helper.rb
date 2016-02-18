ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'vcr'
require 'webmock'

def user
  User.create(
              nickname: "brantwellman",
              provider: "github",
              name: "Brant Wellman",
              email: "brantwellman@gmail.com",
              uid: ENV['BW_UID'],
              token: ENV['TOKEN'],
              image: "https://avatars.githubusercontent.com/u/6422641?v=3"
              )
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end



  config.before :each do
    OmniAuth.config.mock_auth[:github] = nil
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({ 'provider' => 'github',
                     'uid' => ENV['BW_UID'],
                     'credentials' => { 'token' => ENV['TOKEN'] },
                     'info' => {
                                'name' => 'Brant Wellman',
                                'email' => 'brantwellman@gmail.com',
                                'nickname' => 'brantwellman',
                                'image' => "https://avatars.githubusercontent.com/u/6422641?v=3"
                                }
                     })
  end
end
