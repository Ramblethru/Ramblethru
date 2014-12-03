class Discover < ActiveRecord::Base
  include FriendlyId

  friendly_id :destination, use: :slugged


  geocoded_by :destination
  after_validation :geocode, :if => :destination_changed?


  before_save { |discover| discover.destination.downcase! }



end
