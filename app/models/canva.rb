class Canva
  include Mongoid::Document
  field :a_id, type: String
  field :a_type, type: String
  field :label, type: String
  field :width, type: Integer
  field :height, type: Integer
end
