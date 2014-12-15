class User < ActiveRecord::Base

  has_many :rambles
  has_many :notes, through: :rambles
  has_many :authorizations

  validates :name, presence: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[\w\-\.]+@[\w\-\.]+\Z/, message: "must be a valid email address" }

  has_secure_password

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :top => "30x30" }, :default_url => "/images/missing.png"
  validates_attachment :avatar,
  :content_type => { :content_type => ["image/jpeg", "image/png"] }

  def self.find_or_create_by_auth_hash(auth_hash)
    auth = Authorization.find_or_create_by!(provider: auth_hash["provider"],
                                            uid: auth_hash["uid"])
    auth.update!(token: auth_hash["credentials"]["token"])
    unless auth.user
      auth.create_user!(email: auth_hash["info"]["email"],
                        name: auth_hash["info"]["name"])
      auth.save!
    end
    auth.user
  end
end
