class Note < ActiveRecord::Base

  has_and_belongs_to_many :tags
  # belongs_to :user, through: :rambles SO says 'A belongs_to association cannot have a :through option.'
  belongs_to :ramble

  validates :body, presence: true
end
