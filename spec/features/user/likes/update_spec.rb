require "rails_helper"

feature "Update like" do
  include_context "current user signed in"
  let(:another_user) { create :user }
  let(:tip_from_another_user) { create :tip, user: another_user }

  scenario "User can like tip" do
    visit "/"

    expect(page).to have_content("My Tips")
  end
end
