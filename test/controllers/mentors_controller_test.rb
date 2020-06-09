require 'test_helper'

class MentorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mentor = mentors(:one)
  end

  test "should get index" do
    get mentors_url
    assert_response :success
  end

  test "should get new" do
    get new_mentor_url
    assert_response :success
  end

  test "should create mentor" do
    assert_difference('Mentor.count') do
      post mentors_url, params: { mentor: { email: @mentor.email, first_name: @mentor.first_name, is_active: @mentor.is_active, is_approved: @mentor.is_approved, last_name: @mentor.last_name, manager_email: @mentor.manager_email, manager_name: @mentor.manager_name, skills: @mentor.skills } }
    end

    assert_redirected_to mentor_url(Mentor.last)
  end

  test "should show mentor" do
    get mentor_url(@mentor)
    assert_response :success
  end

  test "should get edit" do
    get edit_mentor_url(@mentor)
    assert_response :success
  end

  test "should update mentor" do
    patch mentor_url(@mentor), params: { mentor: { email: @mentor.email, first_name: @mentor.first_name, is_active: @mentor.is_active, is_approved: @mentor.is_approved, last_name: @mentor.last_name, manager_email: @mentor.manager_email, manager_name: @mentor.manager_name, skills: @mentor.skills } }
    assert_redirected_to mentor_url(@mentor)
  end

  test "should destroy mentor" do
    assert_difference('Mentor.count', -1) do
      delete mentor_url(@mentor)
    end

    assert_redirected_to mentors_url
  end
end
