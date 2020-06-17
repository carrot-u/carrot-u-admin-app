require 'test_helper'

class HomeworkSubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @homework_submission = homework_submissions(:one)
  end

  test "should get index" do
    get homework_submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_homework_submission_url
    assert_response :success
  end

  test "should create homework_submission" do
    assert_difference('HomeworkSubmission.count') do
      post homework_submissions_url, params: { homework_submission: { course_session_user_id: @homework_submission.course_session_user_id, homework_id: @homework_submission.homework_id, is_public: @homework_submission.is_public, pull_request: @homework_submission.pull_request } }
    end

    assert_redirected_to homework_submission_url(HomeworkSubmission.last)
  end

  test "should show homework_submission" do
    get homework_submission_url(@homework_submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_homework_submission_url(@homework_submission)
    assert_response :success
  end

  test "should update homework_submission" do
    patch homework_submission_url(@homework_submission), params: { homework_submission: { course_session_user_id: @homework_submission.course_session_user_id, homework_id: @homework_submission.homework_id, is_public: @homework_submission.is_public, pull_request: @homework_submission.pull_request } }
    assert_redirected_to homework_submission_url(@homework_submission)
  end

  test "should destroy homework_submission" do
    assert_difference('HomeworkSubmission.count', -1) do
      delete homework_submission_url(@homework_submission)
    end

    assert_redirected_to homework_submissions_url
  end
end
