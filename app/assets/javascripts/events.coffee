# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#new-todo').click (event) ->
    event.preventDefault()
    $('#new_todo_form').toggle()
    
$(document).on 'click', '.edit-button',  (event) ->
  # send POST to controller and recieve back parial as form
  new EditDate(@)

$(document).on 'click', '.delete-button',  (event) ->
  event.preventDefault()
  new DeleteTodo($(@.form))
  
class EditDate
  constructor: (element) ->
    @$element = $(element)
    url = @$element.data('url')
    start_time = @$element.data('start-time')
    target = @$element.data('target')
    @getEvents(url, start_time, target)

  getEvents: (url, start_time, target) ->
    $.get
      url: url
      data : { start_time : start_time }
      beforeSend: =>
        $('#loading').show();
      success: ->
        $('#'+target).openModal();
        $('#loading').hide();
        # /slight delay neeeds fix
      error: ->
    

$(document).on 'click', '#save-event-button',  (event) ->
  event.preventDefault()
  new SaveEvent($(@.form))
  
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
      console.log(form.serialize())
      beforeSend: =>
  
      success: ->
        
      error: ->
        form.append('Something went wrong :(')


$(document).on 'click', '#addNewEvent',  ->
  $("#event_fields").append($('#new_event_field').html())
  

@removeEvent = (element) ->
  element.parent().remove()
  
  
  