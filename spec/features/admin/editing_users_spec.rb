require "rails_helper"

RSpec.feature "admins can edit user info" do
  let(:admin) { FactoryGirl.create(:user, :admin)}
  let(:user) { FactoryGirl.create(:user)}

  before do
    login_as(admin)
    visit admin_user_path(user)
    click_link "Edit"
  end

  scenario "with valid info" do
    fill_in "Email", with: "jallo@example.com"

    click_button "Update User"

    expect(page).to have_content "User successfully updated"
    expect(page).to have_content "jallo@example.com"
    expect(page).to_not have_content user.email
  end

  scenario "when granting admin privelages" do
    check "is an admin?"

    click_button "Update User"

    expect(page).to have_content "User successfully updated"
    expect(page).to have_content "#{user.email} (Admin)"
  end
end
