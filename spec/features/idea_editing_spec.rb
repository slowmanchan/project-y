require "rails_helper"

RSpec.feature "Users can edit ideas" do
  let(:project) { FactoryGirl.create(:project, title: "React")}
  let(:idea) { FactoryGirl.create(:idea, project: project, title: "Use rails instead")}

  before do
    visit project_idea_path(project, idea)
    click_link "Edit Idea"
  end

  scenario "with valid info" do
    fill_in "Title", with: "I ment Jquery"
    click_button "Save"

    expect(page).to have_content "Idea edited successfully"

    within("#idea h2") do
      expect(page).to have_content "I ment Jquery"
      expect(page).not_to have_content "Use rails instead"
    end
  end

  scenario "with invalid info" do
    fill_in "Title", with: ""
    click_button "Save"

    expect(page).to have_content "Idea not saved"
  end
end
