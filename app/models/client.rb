class Client < ActiveRecord::Base
  def self.seed_data!
    Client.delete_all
    ages = (18..85).to_a

    500.times do |number|
      age = ages.sample
      Client.create(
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :gender => ['M', 'F'].sample,
        :age => age
      )
    end
  end
end
