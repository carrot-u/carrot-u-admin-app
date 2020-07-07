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
  # Instance methods
  #
  def start_to_s
    if !self.start_date?
      "Session start date has not been scheduled."
    elsif self.start_date > Time.now
      "Starts " +  self.start_date&.strftime('%m-%d-%Y') if self.start_date?
    else
      "Started " +  self.start_date&.strftime('%m-%d-%Y') if self.start_date?
    end
  end

  def destroy_lectures
    self.lectures.destroy_all
  end

  def status_badge
    "badge badge-pill badge-#{@@badges[self.status.to_sym]}"
  end
end
