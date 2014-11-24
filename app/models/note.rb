class Note < ActiveRecord::Base


  belongs_to :user
  belongs_to :ramble

  validates :body, presence: true
end
