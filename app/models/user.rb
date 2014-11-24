class User < ActiveRecord::Base

  has_many :rambles
  has_many :notes, through: :rambles

  validates :name, presence: true
  validates :email, presence: true
           

  has_secure_password

  has_attached_file :photo, :styles => { :medium => "300x300>",
                                         :thumb => "100x100>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  has_many :authorizations

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
