require "application_system_test_case"

class PhrasesTest < ApplicationSystemTestCase
  setup do
    @phrase = phrases(:one)
  end

  test "visiting the index" do
    visit phrases_url
    assert_selector "h1", text: "Phrases"
  end

  test "creating a Phrase" do
    visit phrases_url
    click_on "New Phrase"

    fill_in "Category", with: @phrase.category
    fill_in "English", with: @phrase.english
    fill_in "German", with: @phrase.german
    click_on "Create Phrase"

    assert_text "Phrase was successfully created"
    click_on "Back"
  end

  test "updating a Phrase" do
    visit phrases_url
    click_on "Edit", match: :first

    fill_in "Category", with: @phrase.category
    fill_in "English", with: @phrase.english
    fill_in "German", with: @phrase.german
    click_on "Update Phrase"

    assert_text "Phrase was successfully updated"
    click_on "Back"
  end

  test "destroying a Phrase" do
    visit phrases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Phrase was successfully destroyed"
  end
end
