class Userreport < ApplicationRecord
    enum report:{kakomon: 0,board:1,dm:2}
    belongs_to :end_user
end
