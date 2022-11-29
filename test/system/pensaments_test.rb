require "application_system_test_case"

class PensamentsTest < ApplicationSystemTestCase
  setup do
    @pensament = pensaments(:one)
  end

  test "visiting the index" do
    visit pensaments_url
    assert_selector "h1", text: "Pensaments"
  end

  test "should create pensament" do
    visit pensaments_url
    click_on "New pensament"

    fill_in "Description", with: @pensament.description
    fill_in "User", with: @pensament.user_id
    click_on "Create Pensament"

    assert_text "Pensament was successfully created"
    click_on "Back"
  end

  test "should update Pensament" do
    visit pensament_url(@pensament)
    click_on "Edit this pensament", match: :first

    fill_in "Description", with: @pensament.description
    fill_in "User", with: @pensament.user_id
    click_on "Update Pensament"

    assert_text "Pensament was successfully updated"
    click_on "Back"
  end

  test "should destroy Pensament" do
    visit pensament_url(@pensament)
    click_on "Destroy this pensament", match: :first

    assert_text "Pensament was successfully destroyed"
  end
end
