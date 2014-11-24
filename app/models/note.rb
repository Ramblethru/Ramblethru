class Note < ActiveRecord::Base

  acts_as_taggable # Alias for acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :ramble

  validates :body, presence: true
end
