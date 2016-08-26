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
  
$(document).on 'ajax:before', 'form.unsubscribe-form', ->
  $(@).append( '<i class="fa fa-cog fa-spin fa-fw"></i><span class="sr-only">Loading...</span>' )
  $(@).find('.unsubscribe-feed-button').val('Unsubscribing...')

$(document).on 'click', '.unsubscribe-feed-button',  (event) ->
  event.preventDefault()
  new UnsubscribeToFeed($(@.form))

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
      beforeSend: =>
        button.prop( 'disabled', true )
        $('[id^=feed_'+feed_id+']').find('.card').append( '<div class="loading-overlay"><span class="center-align"><i class="spinner-cog fa fa-cog fa-spin fa-4x"></i>Subscribing...</span>' )
      success: ->
        $('[id^=feed_'+feed_id+']').remove()
      error: ->
        $('[id^=feed_'+feed_id+']').find('.loading-overlay').remove()
        $('[id^=feed_'+feed_id+']').find('.card').append( '<div class="loading-overlay"><span class="center-align error-subscribing"><i class="spinner-cog fa fa-frown-o fa-4x"></i><div class="error-subscribing">Something wen\x27t wrong. If this problem persists, try reloading the page or contact us.<div></span>' )

class UnsubscribeToFeed
  constructor: (form) ->
    @$form = $(form)
    url = @$form.attr('action')
    @deleteSubscribedFeed(url, @$form)

  deleteSubscribedFeed: (url, form) ->
    $.ajax
      type: 'DELETE'
      url: url
      beforeSend: =>
        form.find('.unsubscribe-feed-button').prop( 'disabled', true )
        unsubscribedfeedDiv = $('[id^=subscribed_feed_'+form.find('.unsubscribe-feed-button').data('feedid')+']')
        unsubscribedfeedDiv.find('.card').append( '<div class="loading-overlay"><span class="center-align"><i class="spinner-cog fa fa-cog fa-spin fa-4x"></i>Unsubscribing...</span>' )
      success: ->
        $('[id^=subscribed_feed_'+form.find('.unsubscribe-feed-button').data('feedid')+']').remove()
      error: ->
        $('[id^=subscribed_feed_'+form.find('.unsubscribe-feed-button').data('feedid')+']').find('.loading-overlay').remove()
        $('[id^=subscribed_feed_'+form.find('.unsubscribe-feed-button').data('feedid')+']').find('.card').append( '<div class="loading-overlay"><span class="center-align error-subscribing"><i class="spinner-cog fa fa-frown-o fa-4x"></i><div class="error-subscribing">Something wen\x27t wrong. If this problem persists, try reloading the page or contact us.<div></span>' )