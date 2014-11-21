class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_many :rambles
  has_many :notes, through: :rambles

  has_attached_file :photo, :styles => { :medium => "300x300>",
                                         :thumb => "100x100>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
