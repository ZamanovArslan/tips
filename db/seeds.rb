require "csv"
FILE_PATH = "db/seeds/life_areas.csv"

# LifeAreas
CSV.foreach(FILE_PATH, headers: true, header_converters: :symbol) do |row|
  LifeArea.create(value: row[:value], en_value: row[:en_value])
end

# Add admin
User.create(role: :admin, email: ENV["ADMIN_EMAIL"], full_name: "Admin", password: ENV["ADMIN_PASSWORD"])

# Add tips to admin
user = User.find_by(email: ENV["ADMIN_EMAIL"])
20.times do
  FactoryGirl.create(:tip, user: user)
end
