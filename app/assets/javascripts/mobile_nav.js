(function(window, document, $) {

  $(window).on('turbolinks:load', function() {

    //Shows mobile menu on burger button click
    $('.js-burger-btn').on('click', function(e) {
      e.preventDefault();

      if ($('.btn-burger').hasClass( "close" )) {
        moveLeft()
      } else {
        moveRight()
      }
    })
  })

  function moveRight() {
    $('.btn-burger').toggleClass('close');
    $('.nav').toggleClass('active');
    $('.active').animate({
      left: 0
    }, 200, function () {

    })
  }

  function moveLeft() {
    const lengthSlide = $(window).width() + 40
    $('.active').animate({
      left: -lengthSlide
    }, 200, function () {
      $('.btn-burger').toggleClass('close');
      $('.nav').toggleClass('active');
    })

  }
})(window, document, window.jQuery);
