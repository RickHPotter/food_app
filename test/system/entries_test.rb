require 'application_system_test_case'

class EntriesTest < ApplicationSystemTestCase
  setup { @entry = entries(:breakfast) }

  test 'visiting the index' do
    visit entries_url
    assert_selector 'p', text: 'Food App'
    assert_selector 'p', text: Date.today.strftime('%e %b, %Y')
  end

  test 'should create entry' do
    visit entries_url
    click_on 'Create Entry'

    fill_in 'Meal type', with: @entry.meal_type
    fill_in 'Calories', with: @entry.calories
    fill_in 'Proteins', with: @entry.proteins
    fill_in 'Carbohydrates', with: @entry.carbohydrates
    fill_in 'Fats', with: @entry.fats
    click_on 'Create'

    assert_text "#{@entry.meal_type.titleize} was successfully created."
    click_on 'back'
  end

  test 'should update Entry' do
    visit entry_url(@entry)
    click_on 'edit', match: :first

    fill_in 'Calories', with: @entry.calories
    fill_in 'Carbohydrates', with: @entry.carbohydrates
    fill_in 'Fats', with: @entry.fats
    fill_in 'Meal type', with: @entry.meal_type
    fill_in 'Proteins', with: @entry.proteins
    click_on 'Update'

    assert_text "#{@entry.meal_type.titleize} was successfully updated."
    click_on 'back'
  end

  test 'should destroy Entry' do
    visit entry_url(@entry)
    click_on 'delete', match: :first
    page.driver.browser.switch_to.alert.accept
    assert_text "#{@entry.meal_type} was successfully destroyed"
  end

  test 'should not destroy Entry' do
    visit entry_url(@entry)
    click_on 'delete', match: :first
    page.driver.browser.switch_to.alert.dismiss
    assert_no_text "#{@entry.meal_type} was successfully destroyed"
  end
end
