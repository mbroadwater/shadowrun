class Api::V1::DefenseSerializer < ActiveModel::Serializer
  attributes :id, :def_type, :value_normal
end
