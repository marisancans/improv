$(document).on 'turbolinks:load', ->
  $('.flash-message').each -> 
    data = $(@).val()
    data_split = data.split('\\')
    $toastContent = $('<span>' + data_split.join('<br>') + '</span>')
    Materialize.toast $toastContent, 7000, $(@).attr('name')