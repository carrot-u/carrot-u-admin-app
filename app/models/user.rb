# frozen_string_literal: true
require "digest"

class User < ApplicationRecord

  # creates MD5 hash of lowercase email and formats image url for gravatar avatar
  def gravatar_url
    @md5 = Digest::MD5.hexdigest "bradleydixon@gmail.com"
    "https://www.gravatar.com/avatar/" + @md5 + "?d=mp"
  end
end
