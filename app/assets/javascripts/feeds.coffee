$(document).ready ->
  $('.tooltipped').tooltip delay: 50
  
  $('.tooltipped').each (index, element) ->
    span = $('#' + $(element).attr('data-tooltip-id') + '>span:first-child')
    span.before $(element).attr('data-tooltip')
    span.remove()

$(document).on 'mouseover', '.entry--with-hidden-date', ->
  $(@).find('.entry-published-date').slideDown( 300 )
    
$(document).on 'mouseleave', '.entry--with-hidden-date', ->
  $(@).find('.entry-published-date').slideUp( 300 )    
    
$(document).on 'click', '.subscribe-feed-button', ->
  new SubscribeToFeed(@)
   
class SubscribeToFeed
  constructor: (button) ->
    @$button = $(button)
    url = @$button.data('url')
    feed_id = @$button.data('feedid')
    @postSubscribedFeed(url, feed_id, @$button)

  postSubscribedFeed: (url, feed_id, button) ->
    $.post
      url: url
      data : { feed_id : feed_id }
      beforeSend: ->
        $('[id^=feed_]'+feed_id).append( '<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>' )
      success: (data) ->
        $('#loaderDiv').hide()
        $('[id^=feed_]'+feed_id).remove()