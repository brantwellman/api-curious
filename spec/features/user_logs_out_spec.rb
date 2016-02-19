require "rails_helper"

RSpec.feature "user logs out", vcr: true do
  context "user logs out and sees home page" do
    it "can log out" do
      user
      visit root_path

      within(".collapse") do
        click_link "Login with Github"
      end
      
      expect(current_path).to eq(dashboard_path)

      within(".collapse") do
        click_link "Logout"
      end

      expect(current_path).to eq(root_path)
      within(".collapse") do
        expect(page).to have_content("Login with Github")
      end
    end
  end
end
