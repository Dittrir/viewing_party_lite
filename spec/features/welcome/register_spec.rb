require 'rails_helper'

RSpec.describe 'Welcome Register Page' do
  describe 'register view page' do
    it 'has a home link which takes the user back to the home page' do
      visit "/register"

      click_link('Home')
      expect(current_path).to eq(root_path)
    end
    it "displays headers" do
      visit "/register"
      expect(page).to have_content ("Viewing Party Lite")
      expect(page).to have_content ("Create a New User")
    end

    it 'has a form that is filled out and takes you to new user show page' do
      visit "/register"

      fill_in(:name, with: 'Marco')
      fill_in(:email, with: "Marco@gmail.com")
      fill_in(:password, with: "password12345")
      fill_in(:password_confirmation, with: "password12345")

      click_button('Submit')

      last = User.all.last
      expect(current_path).to eq("/users/#{last.id}")
    end

    it "sad path: render flash message" do
      visit "/register"

      fill_in('Name', with: 'Marco Polo')

      click_button('Submit')

      expect(page).to have_content("4 errors prohibited this post from being saved")
      expect(page).to have_content("Email is invalid")
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password digest can't be blank")
      expect(page).to have_content("Password can't be blank")

      expect(current_path).to eq("/register")
    end
  end
end
