# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#new-todo').click (event) ->
    event.preventDefault()
    $('#new_todo_form').toggle()
    
$(document).on 'click', '#addNewEvent',  ->
  $("#event_fields").append($('#new_event_field').html())
    
$(document).on 'click', '.edit-button',  (event) ->
  # send POST to controller and recieve back parial as form
  new EditDay(@)
  
$(document).on 'click', '#save-event-button',  (event) ->
  event.preventDefault()
  new SaveEvent($(@.form))

$(document).on 'click', '.close-button',  (event) ->
  event.preventDefault()
  hideElement(@)

$(document).on 'click', '.delete-button',  (event) ->
  event.preventDefault()
  new DeleteEvents($(@.form))
  
hidePrevious= ->
  $('.card-panel').each (index, event) ->
    $(event).hide()
    
hideElement= (event) ->
  $(event).parent().hide()
  
resizeInputs= ->
  $('input[value]').each ->
    $(this).attr 'size', $(this).attr('value').length
  
class EditDay
  constructor: (element) ->
    @$element = $(element)
    url = @$element.data('url')
    start_time = @$element.data('start-time')
    @getEvents(url, start_time)
    hidePrevious()

  getEvents: (url, start_time) ->
    $.get
      url: url
      data : { start_time : start_time }
      success: ->
        resizeInputs()
      error: ->
    
class SaveEvent
  constructor: (form) ->
    @$form = $(form)
    url = @$form.attr('action')
    @postData(@$form)
  
  postData: (form) ->
    $.ajax
      type: 'POST'
      url: form.attr('action')
      data : form.serialize()
      
      beforeSend: =>
  
      success: ->
        $('#card-panel').hide()
      error: ->

  
  
  