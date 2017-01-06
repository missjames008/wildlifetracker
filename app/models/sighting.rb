class Sighting < ActiveRecord::Base
  belongs_to :animal

  validates :date_time, :latitude, :longitude, presence: true
end
