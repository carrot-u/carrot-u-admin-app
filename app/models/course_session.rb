class CourseSession < ApplicationRecord
  has_many :lectures
  has_many :course_session_participants
  before_destroy :destroy_lectures
  validates :name, presence: true

  scope :students, -> { joins(:course_session_participants).merge(CourseSessionParticipant.student) }

  enum status: [:draft, :admissions, :active, :finished, :archived]

  @@badges = {
    draft: "light",
    admissions: "primary",
    active: "success",
    finished: "warning",
    archived: "secondary"
  }

  #
  # Class methods
  #
  class << self
    def accepting_applications
      CourseSession.where("status = ?",statuses["admissions"]).
        order("start_date ASC")
    end
  end

  #
  # Instance methods
  #
  def start_to_s
    return self.start_date&.strftime('%m-%d-%y')
  end

  def destroy_lectures
    self.lectures.destroy_all
  end

  def status_badge
    "badge badge-pill badge-#{@@badges[self.status.to_sym]}"
  end
end
