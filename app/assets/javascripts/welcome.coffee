# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  setLastLocationMarker()
  setLocation()
  
setLastLocationMarker=->
  
  
setLocation=->  
  handler = Gmaps.build('Google')
  handler.buildMap { internal: id: 'map' }, ->
    polylines = handler.addPolylines([$('#map-data').data('locations')], strokeColor: '#FF0000')
    handler.bounds.extendWith polylines
    handler.fitMapToBounds()
    return
    