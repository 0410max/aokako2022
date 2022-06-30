class Kakomonreport < ApplicationRecord
    belongs_to :kakomon
    belongs_to :end_user
    enum report:{spam: 0,bullying:1,lie:2,dislike:3}
end

