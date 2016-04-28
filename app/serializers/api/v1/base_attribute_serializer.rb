class Api::V1::BaseAttributeSerializer < ActiveModel::Serializer
  attributes :name, :category, :description
end
