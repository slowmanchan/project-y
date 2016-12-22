require "rails_helper"

RSpec.feature "Users can edit their own settings" do
  let(:user) { FactoryGirl.create(:user)}

  before do
    login_as(user)
    visit user_path(user)
    click_link "Edit User"
  end

  scenario "with valid info" do
    fill_in "Email", with: "joo@bar.com"
    fill_in "Bio", with: "I can do many things"
    fill_in "Location", with: "Kanata"

    click_button "Update User"

    expect(page).to have_content "Updated successfully"
    expect(page).to have_content "I can do many things"
    expect(page).to have_content "Kanata"
    expect(page).to have_content "joo@bar.com"
    expect(page).to_not have_content user.email
    expect(page).to_not have_content user.bio
    expect(page).to_not have_content user.location
  end
end
