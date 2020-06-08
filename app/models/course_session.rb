class CourseSession < ApplicationRecord
  has_many :lectures
  before_destroy :destroy_lectures

  def destroy_lectures
    self.lectures.destroy_all
  end
end
