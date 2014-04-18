require 'spec_helper'

describe User do
  context 'creating' do
    it 'allows a user to create an account' do
      visit new_user_registration_path
      user = FactoryGirl.build(:user)
      fill_in :user_name, with: user.name
      fill_in :user_email, with: user.email
      fill_in :user_password, with: user.password
      fill_in :user_password_confirmation, with: user.password
      click_button "Sign up"
      page.should have_content "Welcome! You have signed up successfully."
    end
  end

  context 'editing' do
    it 'allows a registered user to change their username, email, or password' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      click_link "Logged in as #{user.email}"
      fill_in :user_name, with: "Carrots"
      fill_in :user_current_password, with: user.password
      click_button "Update"
      page.should have_content "You updated your account successfully."
    end
    it 'allows a registered user to delete their account' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      click_link "Logged in as #{user.email}"
      click_button "Cancel my account"
      page.should have_content "Bye! Your account was successfully cancelled. We hope to see you again soon."
    end
  end
end
