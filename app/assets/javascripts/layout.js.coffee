$(document).on 'turbolinks:load', ->
  $('.flash-message').each (index, element) ->  
    Materialize.toast $(@).val(), 5000, $(@).attr('name')