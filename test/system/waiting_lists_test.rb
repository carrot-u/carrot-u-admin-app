require "application_system_test_case"

class WaitingListsTest < ApplicationSystemTestCase
  setup do
    @waiting_list = waiting_lists(:one)
  end

  test "visiting the index" do
    visit waiting_lists_url
    assert_selector "h1", text: "Waiting Lists"
  end

  test "creating a Waiting list" do
    visit waiting_lists_url
    click_on "New Waiting List"

    fill_in "Course session", with: @waiting_list.course_session_id
    fill_in "User", with: @waiting_list.user_id
    click_on "Create Waiting list"

    assert_text "Waiting list was successfully created"
    click_on "Back"
  end

  test "updating a Waiting list" do
    visit waiting_lists_url
    click_on "Edit", match: :first

    fill_in "Course session", with: @waiting_list.course_session_id
    fill_in "User", with: @waiting_list.user_id
    click_on "Update Waiting list"

    assert_text "Waiting list was successfully updated"
    click_on "Back"
  end

  test "destroying a Waiting list" do
    visit waiting_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Waiting list was successfully destroyed"
  end
end
