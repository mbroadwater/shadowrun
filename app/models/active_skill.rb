class ActiveSkill < ActiveRecord::Base
  belongs_to :character
  belongs_to :base_skill
  default_scope -> { order(base_skill_id: :asc) }
end
