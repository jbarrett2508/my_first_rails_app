# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Resource.create(year: 1986, title: "Sample",
#           medium: "Book", keywords: "")

years = (1975..2014).to_a
binding.pry
100.times do |number|
  year = years.sample
  title = Faker::Commerce.product_name
  medium = ['Film', 'Book', 'Article', 'Website' ].sample
  year = year
  keywords = Faker::Lorem.word

  Resource.create!(
    title: title,
    medium: medium,
    year: year,
    keywords: keywords
  )
end
