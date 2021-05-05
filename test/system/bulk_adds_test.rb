require "application_system_test_case"

class BulkAddsTest < ApplicationSystemTestCase
  setup do
    @bulk_add = bulk_adds(:one)
  end

  test "visiting the index" do
    visit bulk_adds_url
    assert_selector "h1", text: "Bulk Adds"
  end

  test "creating a Bulk add" do
    visit bulk_adds_url
    click_on "New Bulk Add"

    click_on "Create Bulk add"

    assert_text "Bulk add was successfully created"
    click_on "Back"
  end

  test "updating a Bulk add" do
    visit bulk_adds_url
    click_on "Edit", match: :first

    click_on "Update Bulk add"

    assert_text "Bulk add was successfully updated"
    click_on "Back"
  end

  test "destroying a Bulk add" do
    visit bulk_adds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bulk add was successfully destroyed"
  end
end
