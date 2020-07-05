class CourseSession < ApplicationRecord
  has_many :lectures
  has_many :course_session_participants
  before_destroy :destroy_lectures
  validates :name, presence: true

  scope :students, -> { joins(:course_session_participants).merge(CourseSessionParticipant.student) }

  enum status: [:draft, :admissions, :active, :finished, :archived]

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
    return self.start_date.strftime('%m-%d-%y') if self.start_date
  end

  def destroy_lectures
    self.lectures.destroy_all
  end

  def status_badge
    class_tag = 'badge badge-pill badge-'
    if self.status == 'draft'
      return class_tag + 'light'
    elsif self.status == 'admissions'
      return class_tag + 'primary'
    elsif self.status == 'active'
      return class_tag + 'success'
    elsif self.status == 'finished'
      return class_tag + 'warning'
    elsif self.status == 'archived'
      return class_tag + 'secondary'
    end
  end
end
