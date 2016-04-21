class BaseSkill < ActiveRecord::Base
  has_many :active_skills
  validates :value_base, presence: true
  default_scope -> { order(name: :asc) }
end
