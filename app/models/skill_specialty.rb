class SkillSpecialty < ActiveRecord::Base
  belongs_to :base_skill_specialty
  belongs_to :character
end
