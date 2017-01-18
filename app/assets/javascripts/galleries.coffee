$(document).on 'turbolinks:load', ->
  $('.flash-message').each (index, element) ->  
    Materialize.toast $(element).val(), 5000, $(element).attr('name'), ->

  $grid = $('.grid').imagesLoaded(->
    # init Isotope after all images have loaded
    $grid.isotope
      itemSelector: '.grid-item'
      masonry: columnWidth: 100
  )
  
$ ->
  $('#gallery_image').change ->
    icon = $('#gallery_image-icon')
    icon.toggleClass 'fa-picture-o fa-check-square-o'
    icon.css 'color': 'green';
  
  
 