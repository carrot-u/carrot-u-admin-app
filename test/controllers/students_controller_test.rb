require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as(users(:student))
  end

  #
  # Regular users
  #
  test "should get application page" do
    get students_apply_url
    assert_response :success
  end

  test "should allow add to waiting list" do
    get students_apply_url
    assert_nil @controller.view_assigns[:course_session]
    assert_nil @controller.view_assigns[:waiting_list]
    assert_response :success
  end

  test "should add to waiting list" do
    assert_difference('WaitingList.count') do
      post students_waitlist_url
    end
    assert_response :success
  end

  test "should not add to waiting list again" do
    sign_in_as(users(:waitlisted_student))
    assert_no_difference('WaitingList.count') do
      post students_waitlist_url
    end
    assert_response :success
  end

  test "should not show waiting list to non-admin" do
    get students_waiting_list_url
    assert_not_nil @controller.instance_variable_get(:@notice)
    assert_empty @controller.instance_variable_get(:@waiting_list)
    assert_response :success
  end

  #
  # Admins
  #
  test "should show waiting list to admin" do
    sign_in_as(users(:admin))
    get students_waiting_list_url
    assert_nil @controller.instance_variable_get(:@notice)
    assert_not_empty @controller.instance_variable_get(:@waiting_list)
    assert_response :success
  end
end
