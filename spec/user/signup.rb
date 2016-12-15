require 'rails_helper'

RSpec.describe "user signup page" do

  it "signs me up" do
    visit "/"

    fill_in 'Email', with: "example@example.com"
    fill_in "Password", with: "password"
    fill_in "Password_confirmation", with: "password"

    click_button "Sign up"
    expect(page).to have_content "Success"
  end
end
