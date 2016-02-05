json.array!(@canvas) do |canva|
  json.extract! canva, :id, :a_id, :a_type, :label, :width, :height
  json.url canva_url(canva, format: :json)
end
