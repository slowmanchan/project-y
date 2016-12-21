require "rails_helper"

RSpec.feature "admins can create any user" do
  let(:admin) { FactoryGirl.create(:user, :admin) }

  before do
    login_as(admin)
    visit "/"
    click_link "Admin"
    click_link "Users"
    click_link "New user"
  end

  scenario "with valid info" do
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "password"

    click_button "Create User"

    expect(page).to have_content "User has been created."
  end
end
