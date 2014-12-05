class Note < ActiveRecord::Base

  acts_as_taggable

  belongs_to :user
  belongs_to :ramble

  validates :body, presence: true

end
