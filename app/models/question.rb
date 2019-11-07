class Question < ApplicationRecord
    # model association
    belongs_to :quiz

    # validation
    validates_presence_of :question, :answer
    validates_numericality_of :difficulty, :only_integer => true, allow_nil: true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 3

end
