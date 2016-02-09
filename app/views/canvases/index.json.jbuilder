json.array!(@canvases) do |canvas|
  json.extract! canvas, :id
  json.url canvas_url(canvas, format: :json)
end
