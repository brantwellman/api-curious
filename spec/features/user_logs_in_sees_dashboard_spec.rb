require "rails_helper"

before do
  request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
end

RSpec.feature "user logs in" do
  scenario "admin can bid on a human" do
  end
end
