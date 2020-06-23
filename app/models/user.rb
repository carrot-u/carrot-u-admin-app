# frozen_string_literal: true
require "digest"

class User < ApplicationRecord

  # creates MD5 hash of lowercase email and formats image url for gravatar avatar
  def gravatar_url
    @md5 = Digest::MD5.hexdigest self.email.downcase
    "https://www.gravatar.com/avatar/" + @md5 + "?d=mp"
  end

  def created_date_local
    self.created_at.localtime.to_s.strftime('%m-%d-%y')
  end
end
