class Api::V1::CharAttributeSerializer < ActiveModel::Serializer
  attributes :value_base, :value_modified

  has_one :base_attribute
end
