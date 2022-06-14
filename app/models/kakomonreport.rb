class Kakomonreport < ApplicationRecord
    belongs_to :kakomon
    belongs_to :end_user
    enum report:{content: 0,comment:1}
end

