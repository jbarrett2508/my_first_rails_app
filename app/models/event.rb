class Event < ActiveRecord::Base
  def self.for_date(date)
    where(date: date)
  end
end
