require "rails_helper"

feature "Sign in" do
  include_context "current user signed in"

  scenario "Not admin user have no permissions to admin panel" do
    visit admin_root_path

    expect(page).to have_content("You haven't enough permissions ")
  end
end
