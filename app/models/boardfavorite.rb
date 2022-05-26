class Boardfavorite < ApplicationRecord
    belongs_to :end_user
    belongs_to :board
end
