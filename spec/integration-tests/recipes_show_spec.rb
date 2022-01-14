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

    it 'checks if can see the recipe information' do
      visit '/recipes/1'
      expect(page).to have_content('Recipe # 1')
      expect(page).to have_content('Preparation Time: 1.4 Hours')
      expect(page).to have_content('Public:')
      expect(page).to have_content('Cooking Time: 3.0 Hours')
    end

    it 'checks if can add food to the recipe' do
      visit '/recipes/1'
      expect(page).to have_content('Add New Food')
    end

    it 'checks if can generate shopping list' do
      visit '/recipes/1'
      expect(page).to have_content('Generate shopping list')
    end

    it 'checks when add a new food to the recipe it is displayed' do
      RecipeFood.create(food_id: 1, recipe_id: 1, quantity: 20)
      visit '/recipes/1'
      expect(page).to have_content('Apple')
    end

    it 'checks if can see delete button as recipe owner' do
      RecipeFood.create(food_id: 1, recipe_id: 1, quantity: 20)
      visit '/recipes/1'
      expect(page).to have_selector('.button_to')
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
        visit '/recipes/1'
        expect(page).to have_content('Only owner can delete this recipe food')
        expect(page).not_to have_content('Generate shopping list')
        expect(page).not_to have_content('Add New Food')
      end
    end
  end
end
