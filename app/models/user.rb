class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_many :rambles
  has_many :notes, through: :rambles
<<<<<<< HEAD

  has_attached_file :photo, :styles => { :medium => "300x300>",
                                         :thumb => "100x100>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
=======
  has_many :authorizations

  def self.find_or_create_by_auth_hash(auth_hash)
    auth = Authorization.find_or_create_by!(provider: auth_hash["provider"],
                                            uid: auth_hash["uid"])
    auth.update!(token: auth_hash["credentials"]["token"])

    
      auth.save!

    auth.user
  end
>>>>>>> 6b11f443d83b0303477fed4ca191ee72f447dad8
end
