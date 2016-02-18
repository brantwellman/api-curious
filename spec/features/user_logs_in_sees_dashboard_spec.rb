require "rails_helper"

RSpec.feature "user logs in", type: :feature, vcr: true do
  # VCR.turn_off!
  context "user sees dashboard when loggin in" do
    it "can log in" do
      visit "/"
      click_on "Login with Github"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Brant Wellman")
    end
  end
  # VCR.turn_on!
end
