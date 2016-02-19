require "rails_helper"

RSpec.feature "user logs in", type: :feature, vcr: true do

  context "user sees dashboard when logging in" do
    it "can log in" do
      visit "/"

      within(".collapse") do
        click_link "Login with Github"
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Brant Wellman")
    end
  end
end
