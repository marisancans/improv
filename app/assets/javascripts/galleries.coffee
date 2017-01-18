$(document).on 'turbolinks:load', ->
  initializeIzotope()
  
$ ->
  $('#gallery_image').change ->
    icon = $('#gallery_image-icon')
    icon.toggleClass 'fa-picture-o fa-check-square-o'
    icon.css 'color': 'green';
  
  
initializeIzotope= ->
  $grid = $('.gallery-grid').imagesLoaded(->
      # init Isotope after all images have loaded
      $grid.isotope
        itemSelector: '.gallery-grid-item'
        masonry: percentPosition: true
        stamp: '.stamp'
    )

  

