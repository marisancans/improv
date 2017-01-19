$(document).on 'turbolinks:load', ->
  initGallery()
  initGalleryImages()
  $('.chocolat-parent').Chocolat();
  
$ ->
  $('#gallery_image').change ->
    icon = $('#gallery_image-icon')
    icon.toggleClass 'fa-picture-o fa-check-square-o'
    icon.css 'color': 'green';
  
  
initGallery= ->
  $grid = $('.gallery-grid').imagesLoaded(->
      # init Isotope after all images have loaded
      $grid.isotope
        itemSelector: '.gallery-grid-item'
        masonry: percentPosition: true
        stamp: '.stamp'
    )
    
initGalleryImages= ->
  # $grid = $('.gallery-image-grid').imagesLoaded(->
  #     # init Isotope after all images have loaded
  #     $grid.isotope
  #       itemSelector: '.gallery-grid-image-item'
  #       layoutMode: 'fitColumns'
  #   )

  $grid = $('.gallery-image-grid').isotope(
    itemSelector: '.gallery-grid-image-item'
    percentPosition: true
    masonry: columnWidth: '.gallery-image-grid-sizer')
    
  # layout Isotope after each image loads
  $grid.imagesLoaded().progress ->
    $grid.isotope 'layout'
    return
