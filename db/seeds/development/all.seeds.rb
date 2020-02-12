# Add tips to admin
user = User.find_by(email: ENV["ADMIN_EMAIL"])
company = Company.find_by(name: Company::DEFAULT_NAME)

20.times do
  FactoryGirl.create(:tip, user: user, company: company)
end