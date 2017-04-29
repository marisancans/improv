class LocationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(location)
    @location_hash = Gmaps4rails.build_markers(location) do |l, marker|
      marker.lat location.latitude.to_i
      marker.lng location.longitude.to_i
    end

    ActionCable.server.broadcast "location:#{ location.user.id }", location: @location_hash.to_json
  end
end