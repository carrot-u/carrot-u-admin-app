require "application_system_test_case"

class HomeworkSubmissionsTest < ApplicationSystemTestCase
  setup do
    @homework_submission = homework_submissions(:one)
  end

  test "visiting the index" do
    visit homework_submissions_url
    assert_selector "h1", text: "Homework Submissions"
  end

  test "creating a Homework submission" do
    visit homework_submissions_url
    click_on "New Homework Submission"

    fill_in "Course session user", with: @homework_submission.course_session_participant_id
    fill_in "Homework", with: @homework_submission.homework_id
    check "Is public" if @homework_submission.is_public
    fill_in "Pull request", with: @homework_submission.pull_request
    click_on "Create Homework submission"

    assert_text "Homework submission was successfully created"
    click_on "Back"
  end

  test "updating a Homework submission" do
    visit homework_submissions_url
    click_on "Edit", match: :first

    fill_in "Course session user", with: @homework_submission.course_session_participant_id
    fill_in "Homework", with: @homework_submission.homework_id
    check "Is public" if @homework_submission.is_public
    fill_in "Pull request", with: @homework_submission.pull_request
    click_on "Update Homework submission"

    assert_text "Homework submission was successfully updated"
    click_on "Back"
  end

  test "destroying a Homework submission" do
    visit homework_submissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Homework submission was successfully destroyed"
  end
end
