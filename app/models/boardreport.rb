class Boardreport < ApplicationRecord
    belongs_to :board
    belongs_to :end_user
end
