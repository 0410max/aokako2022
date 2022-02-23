class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :kakomon

  validates_uniqueness_of :kakomon_id, scope: :user_id
end
