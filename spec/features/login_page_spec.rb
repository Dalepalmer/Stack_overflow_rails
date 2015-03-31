require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    expect(page).to have_content 'Signed in'
  end
end
