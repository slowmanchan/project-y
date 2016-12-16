require "rails_helper"

RSpec.feature "users can view ideas for each project" do
  before do
    react = FactoryGirl.create(:project, title: "Reactor")
    FactoryGirl.create(:idea, project: react, title: "Rails", description: "I want it that way")

    jquery = FactoryGirl.create(:project, title: "JQuery")
    FactoryGirl.create(:idea, project: jquery, title: "Wrongo", description: "Bingo")
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
