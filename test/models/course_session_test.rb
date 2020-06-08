require 'test_helper'

class CourseSessionTest < ActiveSupport::TestCase


  test "invalid without name" do
    course_session = CourseSession.new
    assert_not course_session.save
  end

  test "valid course_session" do
    course_session = CourseSession.new(name: '2020 CarrotU Test Session')
    assert course_session.valid?
  end

end
