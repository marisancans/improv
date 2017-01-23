$(document).on 'turbolinks:load', ->
  initGallery()
  initGalleryImages()
  $('.chocolat-parent').Chocolat();
  
$(document).on 'change', '#gallery_image, #gallery_gallery_images', ->
  icon = $('#gallery-image-icon')
  icon.toggleClass 'fa-picture-o fa-check-square-o'
  icon.css 'color': 'green';
    
$(document).on 'click', '.sort-by-button-group', ->
  $grid = $('.gallery-grid')
  sortValue = $(this).attr('data-sort-value')
  ascending = $(this).attr('data-ascending')
  mode = if ascending == 'false' then true else false
  $grid.isotope
    sortBy: sortValue
    sortAscending: mode
    
$(document).on 'click', '.delete-gallery-button', -> 
  target = $(@).data('modal')
  $('#'+target).modal('open');

$(document).on 'click', '.delete-gallery-image-button', -> 
  $(@).hide();
  $(@).siblings('.delete-gallery-image-confirmation').show()
  
$(document).on 'click', '.delete-gallery-image-button-no', -> 
  $(@).parent().hide();
  $(@).parent().siblings('.delete-gallery-image-button').show()
  
initGallery= ->
  $grid = $('.gallery-grid').imagesLoaded(->
      # init Isotope after all images have loaded
      $grid.isotope
        itemSelector: '.gallery-grid-item'
        masonry: percentPosition: true
        stamp: '.stamp'
        getSortData:
          created_at: '[data-created-at]'
    )
    
initGalleryImages= ->
  $grid = $('.gallery-image-grid').isotope(
    itemSelector: '.gallery-grid-image-item'
    percentPosition: true
    masonry: columnWidth: '.gallery-image-grid-sizer')
    
  # layout Isotope after each image loads
  $grid.imagesLoaded().progress ->
    $grid.isotope 'layout'
    return
