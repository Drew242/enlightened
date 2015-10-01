require 'rails_helper'

RSpec.feature 'As a User', type: :feature do

  context "with a Twitter account" do

    it "am able to log in" do
      VCR.use_cassette("user_login_test#login") do
        visit root_path
        login_user

        click_link "Sign Up"
        click_link "Log in with Twitter"

        fill_in "q",  with: "ruby on rails"

        click_button "Search"

        expect(current_path).to eq search_path

        click_button "Save Article"

        visit dashboard_path

        expect(page).to have_content("Ruby on Rails")

        within first(".article") do
          click_link("Ruby on Rails", :match => :first)
        end

        expect(page).to have_content("Delete Article")

        fill_in "article[body]", with: "fun stuff"

        click_button "Save"

        expect(page).to have_content("fun stuff")

        click_link "Delete Article"

        expect(current_path).to eq dashboard_path
      end
    end

  end
end
