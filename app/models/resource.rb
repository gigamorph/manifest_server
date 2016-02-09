class Resource
  include Mongoid::Document
  field :@id, type: String
  field :@type, type: String, default: 'dctypes:Image'
  field :format, type: String

  embedded_in :images

  def self.from_json_hash(obj)
    resource = Resource.new do |doc|
      doc['@id'] = obj['@id']
      doc['@type'] = obj['@type'] || @@default_type
    end
    resource
  end
end
