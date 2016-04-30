class CharAttribute < ActiveRecord::Base
  belongs_to :character
  belongs_to :base_attribute
  default_scope -> { order(base_attribute_id: :asc) }
  accepts_nested_attributes_for :base_attribute
end
