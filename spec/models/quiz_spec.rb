require 'rails_helper'

# Test suite for the Quiz model
RSpec.describe Quiz, type: :model do
  # Association test
  # ensure quiz model has a 1:m relationship with the question model
  it { should have_many(:questions).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }


  it { should validate_numericality_of(:difficulty).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:difficulty).is_less_than_or_equal_to(3) }
end