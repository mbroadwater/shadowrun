class Api::V1::SkillSpecialtySerializer < ActiveModel::Serializer
  attributes :base_skill_specialty_id

  has_one :base_skill_specialty
end
