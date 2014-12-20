json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :age, :height_in_inches, :weight_in_lbs, :wellness_goals
  json.url profile_url(profile, format: :json)
end
