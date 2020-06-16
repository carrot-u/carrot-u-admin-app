class Lecture < ApplicationRecord
  belongs_to :course_session
  has_one :homework

  def has_homework?
    !self.homework.nil?
  end
end
