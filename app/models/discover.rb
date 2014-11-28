class Discover < ActiveRecord::Base
  geocoded_by :destination
  after_validation :geocode, :if => :destination_changed?

  def getPins
    getPins= [@discover.longitude, @discover.latitude]
  end
end
