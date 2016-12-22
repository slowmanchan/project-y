require "rails_helper"

RSpec.describe "users can delete projects" do
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:project, user: user, title: "Reactor")
    visit "/"
    click_link "Reactor"
    click_link "Delete"

    expect(page).to have_content "Project deleted"
    expect(page.current_url).to eq projects_url
    expect(page).to have_no_content "Reactor"
  end
end
