require 'rails_helper'

RSpec.feature 'As a User', type: :feature do

  context "with a Twitter account" do

    it "am able to log in" do
      VCR.use_cassette("user_login_test#login") do
        visit root_path
        login_user

        click_link "Sign Up"
        click_link "Log in with Twitter"

        expect(current_path).to eq dashboard_path
      end
    end

  end
end
