class User < ActiveRecord::Base

  has_secure_password

  has_many :rambles
  has_many :notes, through: :rambles

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
