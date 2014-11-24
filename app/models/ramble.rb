class Ramble < ActiveRecord::Base

	belongs_to :user
	has_many :notes, dependent: :destroy

	# validates :name, presence: true
	validates :destination, presence: true

end
