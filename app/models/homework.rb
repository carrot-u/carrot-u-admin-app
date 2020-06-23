class Homework < ApplicationRecord
  belongs_to :lecture

  def get_course_session_id
    @lecture = Lecture.find(self.lecture_id)
    @lecture.course_session_id
  end

  def due_date_to_s
    return self.due_date.localtime.strftime("%m-%d-%y")
  end
end
