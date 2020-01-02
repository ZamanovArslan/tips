require "csv"

namespace :life_areas do
  FILE_PATH = "db/seeds/life_areas.csv".freeze

  desc "Parse list of life areas"
  task parse: :environment do
    CSV.foreach(FILE_PATH, headers: true, header_converters: :symbol) do |row|
      LifeArea.create(value: row[:value], en_value: row[:en_value])
    end
  end
end
