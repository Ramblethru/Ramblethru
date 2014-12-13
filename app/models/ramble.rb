require "addressable/uri"
class Ramble < ActiveRecord::Base
  include FriendlyId

  friendly_id :destination, use:[:slugged, :finders]
  geocoded_by :destination
  after_validation :geocode, :if => :destination_changed?

	belongs_to :user
	has_many :notes, dependent: :destroy

  before_save { |ramble| ramble.destination.downcase! }

  validates :destination, presence: true

  def self.search(query)
    #where(:destination, query)
    where("destination like ?", "%#{query.downcase}%")
  end
end
