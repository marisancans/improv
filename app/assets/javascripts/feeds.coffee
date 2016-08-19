$(document).ready ->
  $('.tooltipped').tooltip delay: 50
  
  $('.tooltipped').each (index, element) ->
    span = $('#' + $(element).attr('data-tooltip-id') + '>span:first-child')
    span.before $(element).attr('data-tooltip')
    span.remove()