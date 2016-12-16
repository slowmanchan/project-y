require "rails_helper"

RSpec.feature "Allow users to sign in" do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit "/"
    click_link "Sign in"
  end

  scenario "with valid credintials" do
    fill_in "Email", with: "test1@example.com"
    fill_in "user_password", with: "password"

    click_button "Log in"

    expect(page).to have_content "Signed in successfully"
    expect(page).to have_content "#{user.email}"
  end

end
