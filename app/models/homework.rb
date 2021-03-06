class Homework < ApplicationRecord
  belongs_to :lecture
  has_many :homework_submissions

  def get_course_session_id
    @lecture = Lecture.find(self.lecture_id)
    @lecture.course_session_id
  end

  def get_lecture_name
    @lecture = Lecture.find(self.lecture_id)
    @lecture.lecture_name
  end

  def due_date_to_s
    return self.due_date&.strftime("%m-%d-%y")
  end
end
