require 'rails_helper'

RSpec.describe RecipesController, type: :feature do
  describe 'Testing recipe index view' do
    before(:each) do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: 'rupert@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Log in'
    end

    it 'checks if can see the all user recipes' do
      visit '/recipes/'
      expect(page).to have_selector('.recipe-container', count: 2)
    end

    it 'checks if can add a new recipe' do
      visit '/recipes/'
      expect(page).to have_content('Add New Recipe')
    end

    it 'checks if can see delete button as recipe owner' do
      visit '/recipes/'
      expect(page).to have_selector('.button_to')
    end

    it 'checks when click on recipe redirects to show recipe' do
      visit '/recipes/'
      click_on ('Panna cotta')
      expect(page).to have_current_path('/recipes/1')
    end

    describe 'Testing with other user' do
      before(:each) do
        visit '/users/sign_out'
      end
      it 'checks if recipes only shows for owner user' do
        visit '/users/sign_in'
        within('#new_user') do
          fill_in 'user_email', with: 'elisa@gmail.com'
          fill_in 'user_password', with: '1234567'
        end
        click_button 'Log in'
        visit '/recipes/'
        expect(page).not_to have_content('.recipe-container')
      end
    end
  end
end
