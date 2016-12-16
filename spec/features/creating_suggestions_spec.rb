require "rails_helper"

RSpec.describe "User can add ideas to projects" do
  before do
    project = FactoryGirl.create(:project, title: "React Graphs")

    visit project_path(project)
    click_link "New idea"
  end

  scenario "with valid info" do
    fill_in "Title", with: "Try using D3 instead"
    fill_in "Description", with: "D3 might be a better choice for your project as it uses alot of stuff"
    click_button "Save"

    expect(page).to have_content "Idea added successfully"
  end

  scenario "with invalid info" do
    click_button "Save"

    expect(page).to have_content "Idea not added"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

end
