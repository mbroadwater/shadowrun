class Api::V1::BaseSkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :group, :description
end
