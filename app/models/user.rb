class User < ActiveRecord::Base

  has_secure_password

  has_many :rambles
  has_many :notes, through: :rambles
end
