require 'rails_helper'

# Test suite for the Question model
RSpec.describe Question, type: :model do
  # Association test
  # ensure an item record belongs to a single quiz record
  it { should belong_to(:quiz) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:answer) }

  it { should validate_numericality_of(:difficulty).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:difficulty).is_less_than_or_equal_to(3) }
end