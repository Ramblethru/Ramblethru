class Discover < ActiveRecord::Base
  geocoded_by :destination
  after_validation :geocode, :if => :destination_changed?

    def to_param
    "#{id} #{destination}".parameterize
  end

end
