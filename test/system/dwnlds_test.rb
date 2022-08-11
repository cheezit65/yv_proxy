require "application_system_test_case"

class DwnldsTest < ApplicationSystemTestCase
  setup do
    @dwnld = dwnlds(:one)
  end

  test "visiting the index" do
    visit dwnlds_url
    assert_selector "h1", text: "Dwnlds"
  end

  test "creating a Dwnld" do
    visit dwnlds_url
    click_on "New Dwnld"

    click_on "Create Dwnld"

    assert_text "Dwnld was successfully created"
    click_on "Back"
  end

  test "updating a Dwnld" do
    visit dwnlds_url
    click_on "Edit", match: :first

    click_on "Update Dwnld"

    assert_text "Dwnld was successfully updated"
    click_on "Back"
  end

  test "destroying a Dwnld" do
    visit dwnlds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dwnld was successfully destroyed"
  end
end
