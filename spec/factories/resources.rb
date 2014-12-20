FactoryGirl.define do
  factory :resource do
    title { Faker::Commerce.product_name }
    medium { ['Film', 'Book', 'Article', 'Website'].sample }
    year { rand(1975..2014) }
    keywords { Faker::Lorem.word }
  end

end
