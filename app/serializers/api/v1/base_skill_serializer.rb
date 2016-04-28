class Api::V1::BaseSkillSerializer < ActiveModel::Serializer
  attributes :name, :group, :description
end
