class Manifest
  include Mongoid::Document

  field :a_context, type: String, default: 'http://iiif.io/api/presentation/2/context.json'
  field :a_id, type: String
  field :a_type, type: String, default: 'sc:Manifest'
  field :label, type: String

  validates_presence_of :a_context, :a_id, :a_type, :label
end
