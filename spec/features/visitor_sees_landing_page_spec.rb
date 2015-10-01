require 'rails_helper'

RSpec.feature "As a visitor", type: :feature do

  context 'when going to the landing page' do

    it 'sees expected content' do
      visit root_path

      expect(page).to have_content("Enlightened")
      expect(page).to have_content("Sign Up")
    end

  end
end
