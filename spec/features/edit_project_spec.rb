require "rails_helper"

RSpec.describe "users can edit projects" do
  before do
    FactoryGirl.create(:project, title: "React chess")
    visit "/"
    click_link "React chess"
    click_link "Edit project"
  end

  scenario "with valid info" do
    fill_in "Title", with: "Reactor"
    fill_in "Description", with: "some stuff"
    select "2", from: "Difficulty Level"
    
    click_button "Update Project"

    expect(page).to have_content "Project saved!"
    expect(page).to have_content "Reactor"
  end

  scenario "with invalid info" do
    fill_in "Title", with: ""
    click_button "Update Project"

    expect(page).to have_content "Project not saved"
  end
end
