$(document).on 'turbolinks:load', ->


App.room = App.cable.subscriptions.create "LocationChannel",
  received: (data) ->
    console.log data.location
    a = data.location
    handler = Gmaps.build('Google')
    handler.buildMap { internal: id: 'map' }, ->
      markers = handler.addMarkers(a)
     

    
  connected: ->
    console.log 'Connected location'
    

  
