require "application_system_test_case"

class ArchivesTest < ApplicationSystemTestCase
  setup { @entry = entries(:lunch) }

  test 'visiting the archives index' do
    visit archives_index_path
    assert_selector 'p', text: 'Food App'
    assert_selector 'p', text: 'Archive'

    assert_selector 'h3', text: "Entries for #{@entry.day}"
  end
end
