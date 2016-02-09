class Canvas
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  @@default_context = 'http://iiif.io/api/presentation/2/context.json'
  @@default_type = 'sc:Canvas'

  field :@id, type: String
  field :@context, type: String, default: @@default_context
  field :@type, type: String, default: @@default_type
  field :label, type: String
  field :width, type: Integer
  field :height, type: Integer

  belongs_to :sequence
  embeds_many :images

  def self.from_json_hash(obj)
    canvas = Canvas.new do |doc|
      doc['@context'] = obj['@@context'] || @@default_context
      doc['@id'] = obj['@id']
      doc['@type'] = obj['@type'] || @@default_type
      doc.label = obj['label']
      doc.width = obj['width'] if obj['width']
      doc.height = obj['height'] if obj['height']
    end

    obj['images'].each do |image_hash|
      canvas.images << Image.from_json_hash(image_hash)
      if image_hash['resource']
        canvas.images.last.resource = Resource.from_json_hash(image_hash['resource'])
      end
    end

    canvas
  end
end
