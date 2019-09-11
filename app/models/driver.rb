class Driver < ActiveRecord::Base
  has_secure_password
  has_many :contents

  def slug
    username = self.username
    slug = username.downcase.strip.gsub(" ","-")
  end









end
