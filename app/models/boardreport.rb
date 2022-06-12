class Boardreport < ApplicationRecord
    belongs_to :board
    belongs_to :end_user
    enum report:{content: 0,comment:1}
end

