class Character < ActiveRecord::Base
  belongs_to :user
  has_many :defenses
  has_many :char_attributes
  has_many :active_skills
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
end
