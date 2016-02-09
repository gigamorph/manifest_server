json.array!(@resources) do |resource|
  json.extract! resource, :id, :a_id, :a_type, :format
  json.url resource_url(resource, format: :json)
end
