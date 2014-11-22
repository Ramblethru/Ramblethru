class Ramble < ActiveRecord::Base

  belongs_to :user
  has_many :notes

validates :name, presence: true
validates :destination, presence: true

end
