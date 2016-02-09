class Sequence
  include Mongoid::Document

  @@default_type = 'sc:Sequence'

  include Mongoid::Document

  field :@id, type: String
  field :@type, type: String, default: @@default_type
  field :label, type: String
  field :viewingDirection, type: String
  field :viewingHint, type: String

  embedded_in :manifests
  has_many :canvases

  def serializable_hash(options={})
    hash = super(options);
    hash[:canvases] = canvases.inject([]) do |acc, m|
      acc << m.serializable_hash
      acc
    end
    hash
  end

  def self.from_json_hash(obj)
    sequence = Sequence.new do |doc|
      doc['@id'] = obj['@id']
      doc['@type'] = obj['@type'] || @@default_type
      doc.label = obj['label']
      doc.viewingDirection = obj['viewingDirection'] if obj['viewingDirection']
      doc.viewingHint = obj['viewingHint'] if obj['viewingHint']
    end
    sequence
  end
end
