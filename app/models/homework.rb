class Homework < ApplicationRecord
  belongs_to :lecture

  def get_course_session_id
    @lecture = Lecture.find(self.lecture_id)
    @lecture.course_session_id
  end
end
