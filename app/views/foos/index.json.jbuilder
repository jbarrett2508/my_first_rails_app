json.array!(@foos) do |foo|
  json.extract! foo, :id, :first_name, :last_name
  json.url foo_url(foo, format: :json)
end
