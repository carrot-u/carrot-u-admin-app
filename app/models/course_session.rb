class CourseSession < ApplicationRecord
  has_many :lectures
  before_destroy :destroy_lectures
  validates :name, presence: true

  #
  # Class methods
  #
  class << self
    def accepting_applications
      CourseSession.where("start_date > ?", Time.now).
        order("start_date ASC")
    end
  end

  #
  # Instance methods
  #
  def start_to_s
    return self.start_date.strftime('%m-%d-%y')
  end

  def destroy_lectures
    self.lectures.destroy_all
  end
end
