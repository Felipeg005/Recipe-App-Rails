require 'rails_helper'

RSpec.describe RecipesController, type: :feature do
  describe 'Testing recipe show view' do
    before(:each) do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: 'rupert@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Log in'
    end

    it 'checks that only public recipes are rendered' do
      visit '/public_recipes/'
      expect(page).to have_content('Cheese Cake')
      expect(page).not_to have_content('Panna cotta')
      expect(page).to have_selector('.recipe-container', count: 1)
    end
  end
end
