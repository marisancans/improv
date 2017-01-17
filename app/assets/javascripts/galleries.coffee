$(document).on 'turbolinks:load', ->
  $('.grid').isotope
    itemSelector: '.grid-item'
    masonry: columnWidth: 100