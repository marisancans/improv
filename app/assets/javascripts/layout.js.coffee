$(document).on 'turbolinks:load', ->
  $('.flash-message').each -> 
    data = $(@).val()
    data_split = data.split('\\')
    $toastContent = $('<span>' + data_split.join('<br>') + '</span>')
    Materialize.toast $toastContent, 7000, $(@).attr('name')
    
  $('.modal').each -> 
    $(@).modal()
    
  $('.parallax').each -> 
    $(@).parallax()
    
  $(".button-collapse").sideNav();
  
$(document).on 'click', '.modal-close', -> 
  target = $(@).data('modal')
  $('#'+target).modal('close')
    