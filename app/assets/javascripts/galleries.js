// Generated by CoffeeScript 1.10.0
(function() {
  var initGallery, initGalleryImages;

  $(document).on('turbolinks:load', function() {
    initGallery();
    initGalleryImages();
    return $('.chocolat-parent').Chocolat();
  });

  $(document).on('change', '#gallery_image, #gallery_gallery_images', function() {
    var icon;
    icon = $('#gallery-image-icon');
    icon.toggleClass('fa-picture-o fa-check-square-o');
    return icon.css({
      'color': 'green'
    });
  });

  $(document).on('click', '.sort-by-button-group', function() {
    var $grid, ascending, mode, sortValue;
    $grid = $('.gallery-grid');
    sortValue = $(this).attr('data-sort-value');
    ascending = $(this).attr('data-ascending');
    mode = ascending === 'false' ? true : false;
    return $grid.isotope({
      sortBy: sortValue,
      sortAscending: mode
    });
  });

  $(document).on('click', '.delete-gallery-button', function() {
    var target;
    target = $(this).data('modal');
    return $('#' + target).modal('open');
  });

  $(document).on('click', '.delete-gallery-image-button', function() {
    $(this).hide();
    return $(this).siblings('.delete-gallery-image-confirmation').show();
  });

  $(document).on('click', '.delete-gallery-image-button-no', function() {
    $(this).parent().hide();
    return $(this).parent().siblings('.delete-gallery-image-button').show();
  });

  initGallery = function() {
    var $grid;
    return $grid = $('.gallery-grid').imagesLoaded(function() {
      return $grid.isotope({
        itemSelector: '.gallery-grid-item',
        masonry: {
          percentPosition: true
        },
        stamp: '.stamp',
        getSortData: {
          created_at: '[data-created-at]'
        }
      });
    });
  };

  initGalleryImages = function() {
    var $grid;
    $grid = $('.gallery-image-grid').isotope({
      itemSelector: '.gallery-grid-image-item',
      percentPosition: true,
      masonry: {
        columnWidth: '.gallery-image-grid-sizer'
      }
    });
    return $grid.imagesLoaded().progress(function() {
      $grid.isotope('layout');
    });
  };

}).call(this);