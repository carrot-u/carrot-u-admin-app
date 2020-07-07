class Lecture < ApplicationRecord
  belongs_to :course_session
  before_destroy :destroy_homeworks
  has_one :homework

  enum topic: [:ruby, :rails, :javascript, :react, :html, :sql, :other]

  @@topic_avatars = {
    ruby: "diamond",
    rails: "diamond",
    html: "html5",
    javascript: "js",
    react: "react",
    sql: "database",
    other: "code"
  }


  # better presentation of lecture datetime in user local time
  def scheduled_for_local
    self.schedule_date.localtime&.strftime("%Y/%m/%d at %I:%M%p")
  end

  def has_homework?
    !self.homework.nil?
  end

  def destroy_homeworks
    if has_homework?
      self.homework.destroy
    end
  end

  def lecture_avatar
    @@topic_avatars[self.topic.to_sym]
  end
end
