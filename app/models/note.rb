class Note < ActiveRecord::Base

  has_and_belongs_to_many :tags
  belongs_to :user, through: :rambles
  belongs_to :ramble
end
