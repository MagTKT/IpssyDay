(function($) {
  "use strict"; // Start of use strict

  // Scroll vers l'ancre selectionnée 
  $(document).ready(function(){
    $('.scroll').on('click', function(event) {
      if (this.hash !== "") {
        event.preventDefault();
        var hash = this.hash;

        $('html, body').animate({
          scrollTop: $(hash).offset().top
        }, 1000, function(){

          window.location.hash = hash;
        });
      }
    });
  });

    // Gestion de la navbar au scroll
    var navbarCollapse = function() {
      if ($("#mainNav").offset().top > 100) {
        $("#mainNav").addClass("navbar-shrink");
        $(".scroll").css("padding-top", "20px");
        $(".scroll").css("padding-bottom", "20px");
      } else {
        $("#mainNav").removeClass("navbar-shrink");
      }
    };
    navbarCollapse();
    $(window).scroll(navbarCollapse);

  // Closes responsive menu when a scroll trigger link is clicked
  $('.scroll').click(function() {
    $('.navbar-collapse').collapse('hide');
  });

  // Activate scrollspy to add active class to navbar items on scroll
  $('body').scrollspy({
    target: '#mainNav',
    offset: 56
  });

})(jQuery); // End of use strict
