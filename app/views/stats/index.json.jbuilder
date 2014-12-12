json.array!(@stats) do |stat|
  json.extract! stat, :id, :name, :age, :height_in_inches, :integer, :weight, :wellness_goals
  json.url stat_url(stat, format: :json)
end
