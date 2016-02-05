json.array!(@manifests) do |manifest|
  json.extract! manifest, :id, :a_id, :a_type, :a_context, :label
  json.url manifest_url(manifest, format: :json)
end
