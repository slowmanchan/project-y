require "rails_helper"

RSpec.feature "a user can make projects" do
  scenario "with valid attributes" do
    visit "/"

    click_link "New project"

    fill_in "Title", with: "React Calculator"
    fill_in "Description", with: "I could use some help with the project"

    click_button "submit"

    expect(page).to have_content "Your project is alive!"
  end

end
