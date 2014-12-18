# t.string   "title"
# t.string   "medium"
# t.integer  "year"
# t.text     "keywords"
# t.datetime "created_at"
# t.datetime "updated_at"

class Resource < ActiveRecord::Base
  def self.seed_data!
    years = (1975..2014).to_a

    100.times do |number|
      year = years.sample
      Resource.create(
        :title => Faker::Commerce.product_name,
        :medium => ['Film', 'Book', 'Article', 'Website' ].sample,
        :year => year,
        :keywords => Faker::Lorem.words
      )
    end
  end
end
