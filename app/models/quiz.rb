class Quiz < ApplicationRecord
    # model association
    belongs_to :user
    has_many :questions, dependent: :destroy

    # validations
    validates_presence_of :title, :created_by
    validates_numericality_of :difficulty, :only_integer => true, allow_nil: true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 3
end
