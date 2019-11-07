class Quiz < ApplicationRecord
    # model association
    has_many :items, dependent: :destroy

    # validations
    validates_presence_of :title, :created_by
    validates :difficulty, :greater_than_or_equal_to  1, :less_than_or_equal_to 3
end
