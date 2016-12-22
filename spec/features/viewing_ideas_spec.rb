require "rails_helper"

RSpec.feature "users can view ideas for each project" do
  let(:user) { FactoryGirl.create(:user)}
  let!(:project) { FactoryGirl.create(:project, user: user,  title: "Reactor")}
  let!(:project2) { FactoryGirl.create(:project, user: user, title: "Jquery", description: "I want it that way")}
  let!(:idea) { FactoryGirl.create(:idea, project: project, title: "Rails", description: "I want it that way", user: user)}
  let!(:idea2) { FactoryGirl.create(:idea, project: project2, title: "Wrongo", description: "Wrongo", user: user)}

  before do
    visit "/"
  end

  scenario "for an idea in a chosen project" do
    click_link "Reactor"

    expect(page).to have_content "Rails"
    expect(page).to_not have_content "Wrongo"

    click_link "Rails"
    within("#idea h2") do
      expect(page).to have_content "Rails"
    end

    expect(page).to have_content "I want it that way"

  end
end
