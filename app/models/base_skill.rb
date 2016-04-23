class BaseSkill < ActiveRecord::Base
  has_many :active_skills
  default_scope -> { order(name: :asc) }
end
