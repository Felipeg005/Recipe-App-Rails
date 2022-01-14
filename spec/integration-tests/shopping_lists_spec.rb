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
      RecipeFood.create(food_id: 1, recipe_id: 1, quantity: 20)
      RecipeFood.create(food_id: 2, recipe_id: 2, quantity: 20)
    end

    it 'checks if render general food needed for all recipes of the user' do
      visit '/general_shopping_list/'
      expect(page).to have_content('Apple')
      expect(page).to have_content('Orange')
    end

    it 'checks if render food needed for a specific recipe of the user' do
      visit '/general_shopping_list/1'
      expect(page).to have_content('Apple')
      expect(page).not_to have_content('Orange')
    end

    it 'checks if render food needed for a specific recipe of the user' do
      visit '/general_shopping_list/2'
      expect(page).not_to have_content('Apple')
      expect(page).to have_content('Orange')
    end

    describe 'Testing with other user' do
      before(:each) do
        visit '/users/sign_out'
      end
      it 'checks correct information and buttons only shows for owner user' do
        RecipeFood.create(food_id: 1, recipe_id: 1, quantity: 20)
        visit '/users/sign_in'
        within('#new_user') do
          fill_in 'user_email', with: 'elisa@gmail.com'
          fill_in 'user_password', with: '1234567'
        end
        click_button 'Log in'
        visit '/general_shopping_list/'
        expect(page).not_to have_content('Apple')
        expect(page).not_to have_content('Orange')
      end
    end
  end
end
