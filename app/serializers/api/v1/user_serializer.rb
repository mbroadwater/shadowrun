class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :slack_id
  has_many :characters
end
