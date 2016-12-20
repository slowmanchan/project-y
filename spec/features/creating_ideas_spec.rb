require "rails_helper"

RSpec.describe "User can add ideas to projects" do
  let(:project) { FactoryGirl.create(:project, title: "React Graphs") }
  let(:user) { FactoryGirl.create(:user)}

  before do
    login_as(user)
    visit project_path(project)
    click_link "New idea"
  end

  scenario "with valid info" do
    fill_in "Title", with: "Try using D3 instead"
    fill_in "Description", with: "D3 might be a better choice for your project as it uses alot of stuff"
    click_button "Save"

    expect(page).to have_content "Idea added successfully"
    within("#idea") do
      expect(page).to have_content "Author: #{user.email}"
    end
  end

  scenario "with invalid info" do
    click_button "Save"

    expect(page).to have_content "Idea not added"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

end
