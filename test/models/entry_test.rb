require "test_helper"

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "is valid with valid attributes" do
    entry = Entry.new(meal_type: "test", carbohydrates: 20, protiens: 21, 
      fats: 1231, calories: 12)
    assert entry.save
  end

  test "is not valid with valid attributes" do
    entry = Entry.new(carbohydrates: 20, protiens: 21, 
      fats: 1231, calories: 12)
    assert_not entry.save
  end
end
