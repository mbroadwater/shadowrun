class Defense < ActiveRecord::Base
  belongs_to :character
  validates: :character_id, presence: true
end
