# frozen_string_literal: true
require "digest"

class User < ApplicationRecord

  # creates MD5 hash of lowercase email and formats image url for gravatar avatar
  def gravatar_url
    @md5 = Digest::MD5.hexdigest self.email.downcase
    "https://www.gravatar.com/avatar/" + @md5 + "?d=mp"
  end

  def created_date_local
    self.created_at.localtime.strftime('%m-%d-%y')
  end

  # meh, it's not great but its the best we can do until we separate the name attribute
  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end
end
