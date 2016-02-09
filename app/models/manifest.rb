class Manifest
  @@default_context = 'http://iiif.io/api/presentation/2/context.json'
  @@default_type = 'sc:Manifest'

  include Mongoid::Document
  include Mongoid::Timestamps::Short

  field :@id, type: String
  field :@context, type: String, default: @@default_context
  field :@type, type: String, default: @@default_type
  field :label, type: String

  # ident: object identifier used only internally to build/parse URIs
  # and retrieve manifests.
  field :ident, type: String

  embeds_many :sequences

  #accepts_nested_attributes_for :sequences
  validates_presence_of :@context, :@id, :@type, :label

  before_save do |document|
    document.ident = Mf::Util.extract_manifest_identifier(document['@id'])
  end

  # Create a Manifest from a hash object parsed from a JSON.
  def self.create_from_json_hash(obj)
    manifest = Manifest.new do |doc|
      doc['@context'] = obj['@context'] || @@default_context
      doc['@id'] = obj['@id']
      doc['@type'] = obj['@type'] || @@default_type
      doc.label = obj['label']
    end

    obj['sequences'].each do |sequence_hash|
      manifest.sequences << Sequence.from_json_hash(sequence_hash)
    end

    manifest.save!

    obj['sequences'][0]['canvases'].each do |canvas_hash|
       puts "canvas_hash: #{canvas_hash}"
       canvas = Canvas.from_json_hash(canvas_hash)
       puts "canvas: #{canvas}"
       puts "seq.canvases: #{manifest.sequences[0].canvases}"
       manifest.sequences[0].canvases << canvas
    end

    manifest.save!
    manifest
  end
end
