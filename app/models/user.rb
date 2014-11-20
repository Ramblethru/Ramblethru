class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_many :rambles
  has_many :notes, through: :rambles
end
