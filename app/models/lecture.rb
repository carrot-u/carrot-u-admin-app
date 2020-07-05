class Lecture < ApplicationRecord
  belongs_to :course_session
  before_destroy :destroy_homeworks
  has_one :homework

  enum topic: [:ruby, :rails, :javascript, :react, :html, :sql, :other]


  # better presentation of lecture datetime in user local time
  def scheduled_for_local
    self.schedule_date.localtime.strftime("%Y/%m/%d at %I:%M%p")
  end

  def has_homework?
    !self.homework.nil?
  end

  def destroy_homeworks
    if has_homework?
      self.homework.destroy
    end
  end

  def topic_icon
    if self.topic == 'ruby'
      return "diamond"
    elsif self.topic == 'rails'
      return "diamond"
    elsif self.topic == 'html'
      return "html5"
    elsif self.topic == 'javascript'
      return "js"
    elsif self.topic == 'react'
      return "react"
    elsif self.topic == 'sql'
      return "database"
    elsif self.topic == 'other'
      return "code"
    end
  end
end
