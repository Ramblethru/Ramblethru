class Discover < ActiveRecord::Base
  geocoded_by :destination
  after_validation :geocode, :if => :destination_changed?

end
