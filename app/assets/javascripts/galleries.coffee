$(document).on 'turbolinks:load', ->
  $grid = $('.grid').imagesLoaded(->
    # init Isotope after all images have loaded
    $grid.isotope
      itemSelector: '.grid-item'
      masonry: columnWidth: 100
  )