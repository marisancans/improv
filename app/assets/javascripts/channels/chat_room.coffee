$(document).on 'turbolinks:load', ->
  text_area_refresh()

App.room = App.cable.subscriptions.create "ChatRoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log 'connected'

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append(data.message)
    text_area_refresh()
  
text_area_refresh = () ->
  submit_message()
  objDiv = document.getElementById('messages')
  objDiv.scrollTop = objDiv.scrollHeight
  
submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()