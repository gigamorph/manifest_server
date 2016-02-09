class Image
  include Mongoid::Document

  @@default_context = 'http://iiif.io/api/presentation/2/context.json'
  @@default_type = 'oa:Annotation'
  @@default_motivation = 'sc:painting'

  field :@id, type: String
  field :@type, type: String, default: @@default_type
  field :motivation, default: @@default_motivation
  field :width, type: Integer
  field :height, type: Integer

  embedded_in :canvases
  embeds_one :resource

  def self.from_json_hash(obj)
    image = Image.new do |doc|
      doc['@id'] = obj['@id']
      doc['@type'] = obj['@type'] || @@default_type
      doc.motivation = obj['motivation'] || @@default_motivation
      doc.width = obj['width'] if obj['width']
      doc.height = obj['height'] if obj['height']
    end
    image
  end
end
