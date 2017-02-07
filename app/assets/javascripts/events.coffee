$(document).on 'turbolinks:load', ->
  initUpcomingEventsGrid()

$(document).on 'click', '.day',  (event) ->
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
  
$(document).on 'click', '.sort-by-color-upcoming-events', ->
  $grid = $('.grid-upcoming-events')
  sortValue = $(this).attr('data-filter')
  $grid.isotope
    filter: sortValue
  
hideElement= (event) ->
  $(event).parent().hide()

class EditDay
  constructor: (element) ->
    @$element = $(element)
    url = @$element.data('url')
    start_time = @$element.data('start-time').replace(/\"/g, "")
    @getEvents(url, start_time)

  getEvents: (url, start_time) ->
    $.get
      url: url
      data : { event: { start_time : start_time } }
      success: ->
        # $('input[value]').each ->
        #   $(this).attr 'size', $(this).attr('value').length
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

initUpcomingEventsGrid= ->
  $('.grid-upcoming-events').isotope
    itemSelector: '.grid-item-upcoming-event'
    stamp: '.stamp'
    layoutMode: 'masonry'

    
  
  