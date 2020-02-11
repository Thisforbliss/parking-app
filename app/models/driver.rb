class Driver < ActiveRecord::Base
  has_secure_password
  has_many :contents
  validates :username, uniqueness: true
  validates :phone_number, uniqueness: true

  def slug
    username = self.username
    slug = username.downcase.strip.gsub(" ","-")
  end









end
