class Favorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :kakomon

  validates_uniqueness_of :kakomon_id, scope: :end_user_id
end
