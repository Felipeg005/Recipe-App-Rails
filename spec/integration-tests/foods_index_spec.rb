require 'rails_helper'

RSpec.describe FoodsController, type: :feature do
  describe 'Testing food index view' do
    before(:each) do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: 'rupert@gmail.com'
        fill_in 'user_password', with: '1234567'
      end
      click_button 'Log in'
    end

    it 'checks if can see the foodname of all other foods' do
      visit '/foods/'
      expect(page).to have_selector('.foods-table')
    end

    it 'checks if can see a row for each food' do
      visit '/foods/'
      expect(page).to have_content('Apple')
      expect(page).to have_content('Orange')
    end

    it 'checks if can see all header columns' do
      visit '/foods/'
      expect(page).to have_content('Food')
      expect(page).to have_content('Measurement Unit')
      expect(page).to have_content('Unit Price')
      expect(page).to have_content('Actions')
    end

    it 'checks if can see delete button as food owner' do
      visit '/foods/'
      expect(page).to have_selector('.button_to')
    end

    describe 'Testing with other user' do
      before(:each) do
        visit '/users/sign_out'
      end
      it 'checks if delete button its blocked for users that doesnt own the food' do
        visit '/users/sign_in'
        within('#new_user') do
          fill_in 'user_email', with: 'elisa@gmail.com'
          fill_in 'user_password', with: '1234567'
        end
        click_button 'Log in'
        visit '/foods/'
        expect(page).to have_content('Only owner can delete this food')
      end
    end
  end
end
