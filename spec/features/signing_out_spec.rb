require "rails_helper"

RSpec.feature "allow users to signout" do
  let!(:user) { FactoryGirl.create(:user)}

  before do
    login_as(user)
    visit "/"
  end

  scenario "successfully" do
    click_link "Sign out"
    expect(page).to have_content "Signed out successfully"
  end
end
