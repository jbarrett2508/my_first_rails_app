FactoryGirl.define do
  factory :client do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { ['M', 'F'].sample }
    age { rand(18..85) }
  end

end
