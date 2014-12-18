json.array!(@resources) do |resource|
  json.extract! resource, :id, :title, :medium, :year, :keywords
  json.url resource_url(resource, format: :json)
end
