class CourseSession < ApplicationRecord
  has_many :lectures
  before_destroy :destroy_lectures
  validates :name, presence: true

  def start_to_s
    return self.start_date.strftime('%m-%d-%y')
  end

  def destroy_lectures
    self.lectures.destroy_all
  end
end
