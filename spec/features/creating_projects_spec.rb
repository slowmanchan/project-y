require "rails_helper"

RSpec.feature "a user can make projects" do
  before do
    visit "/"
    click_link "New project"
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "React Calculator"
    fill_in "Description", with: "I could use some help with the project"

    click_button "submit"

    expect(page).to have_content "Your project is alive!"
  end

  scenario "with invalid attributes" do
    click_button "submit"

    expect(page).to have_content "Project has not been created."
    expect(page).to have_content "can't be blank"


  end

end
