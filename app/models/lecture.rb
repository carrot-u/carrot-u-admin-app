class Lecture < ApplicationRecord
  belongs_to :course_session
  before_destroy :destroy_homeworks
  has_one :homework

  def has_homework?
    !self.homework.nil?
  end

  def destroy_homeworks
    self.homework.destroy
  end
end
