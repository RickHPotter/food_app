require 'test_helper'

# testing
class EntryTest < ActiveSupport::TestCase
  test 'should be valid' do
    params = {
      meal_type: 'Meal',
      calories: 3,
      proteins: 1,
      carbohydrates: 3,
      fats: 8
    }
    entry = Entry.new params
    assert entry.save
  end

  test 'should not save, without meal_type' do
    params = { calories: 3, proteins: 1, carbohydrates: 3, fats: 8 }
    entry = Entry.new(params)
    assert_not entry.save
  end

  test 'should not save, without calories' do
    params = { meal_type: 'Meal', proteins: 1, carbohydrates: 3, fats: 8 }
    entry = Entry.new(params)
    assert_not entry.save
  end

  test 'should not save, without proteins' do
    params = { meal_type: 'Meal', calories: 3, carbohydrates: 3, fats: 8 }
    entry = Entry.new(params)
    assert_not entry.save
  end

  test 'should not save, without carbohydrates' do
    params = { meal_type: 'Meal', calories: 3, proteins: 1, fats: 8 }
    entry = Entry.new(params)
    assert_not entry.save
  end

  test 'should not save, without fats' do
    params = { meal_type: 'Meal', calories: 3, proteins: 1, carbohydrates: 3 }
    entry = Entry.new(params)
    assert_not entry.save
  end
end
