require "rails_helper"

RSpec.feature "Users can delete ideas" do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, title: "React")}
  let(:idea) { FactoryGirl.create(:idea, project: project, user: user, title: "Vue JS")}


  before do
    visit project_idea_path(project, idea)
  end

  scenario "successfully" do
    click_link "Delete"
    expect(page).to have_content "Deleted!"
    expect(page.current_url).to eq project_url(project)
  end
end
