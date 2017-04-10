# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
    handler = Gmaps.build('Google')
    handler.buildMap { internal: id: 'map' }, ->
      markers = handler.addMarkers([
        {
          lat: 43
          lng: 3.5
        }
      ])
      handler.bounds.extendWith markers
      handler.fitMapToBounds()
      return