require "rails_helper"

feature "Update like" do
  include_context "current user signed in"
  let(:another_user) { create :user }
  let(:tip_from_another_user) { create :tip, user: another_user }

  let(:like) { page.find("data-id=['#{tip_from_another_user.id}']") }
  let(:like_link) { like.find(".fi-like") }
  let(:likes_count) { like.find(".likes_count") }

  scenario "User can like tip" do
    visit root_path
    debugger
    like.click

    expect(likes_count).to eq(1)
  end
end
