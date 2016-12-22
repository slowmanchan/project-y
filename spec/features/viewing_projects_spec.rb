require "rails_helper"

RSpec.describe "List of projects should be viewable" do

  scenario "with project details" do
    user = FactoryGirl.create(:user)
    project = FactoryGirl.create(:project, user: user,title: "React chess")
    visit "/"
    click_link "React chess"
    expect(page.current_url).to eq project_url(project)
  end

end
