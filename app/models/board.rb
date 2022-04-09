class Board < ApplicationRecord
    belongs_to :user
    has_many :comments,dependent: :destroy

    validates :sub,presence: true
    validates :prof,presence: true
    validates :comment,length: { minimum: 20}
    validates :rate1, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
    validates :rate2, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
    validates :rate3, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true

end
