class User < ActiveRecord::Base
  has_many :rambles
  has_many :notes, through: :rambles

  validates :name, presence: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[\w\-\.]+@[\w\-\.]+\Z/,
                      message: 'must be a valid email address' }

  has_secure_password

end
