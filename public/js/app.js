$(document).ready(function() {
  //Horizontal Tab
  $("#parentHorizontalTab").easyResponsiveTabs({
    type: "default",
    width: "auto",
    fit: true,
    tabidentify: "hor_1",
    // eslint-disable-next-line no-unused-vars
    activate: function(event) {
      var $tab = $(this);
      var $info = $("#nested-tabInfo");
      var $name = $("span", $info);
      $name.text($tab.text());
      $info.show();
    }
  });
});

$("#myModal").on("shown.bs.modal", function() {
  $("#myInput").trigger("focus");
});

$(document).ready(function() {
  $(".owl-team").owlCarousel({
    loop: true,
    margin: 20,
    nav: false,
    responsiveClass: true,
    autoplay: false,
    autoplayTimeout: 5000,
    autoplaySpeed: 1000,
    autoplayHoverPause: false,
    responsive: {
      0: {
        items: 2,
        nav: false
      },
      480: {
        items: 2,
        nav: true
      },
      667: {
        items: 3,
        nav: true
      },
      1000: {
        items: 4,
        nav: true
      }
    }
  });
});

$(document).ready(function() {
  $(".owl-three").owlCarousel({
    loop: true,
    margin: 20,
    nav: false,
    responsiveClass: true,
    autoplay: true,
    autoplayTimeout: 5000,
    autoplaySpeed: 1000,
    autoplayHoverPause: false,
    responsive: {
      0: {
        items: 2,
        nav: false
      },
      480: {
        items: 2,
        nav: true
      },
      667: {
        items: 3,
        nav: true
      },
      1000: {
        items: 6,
        nav: true
      }
    }
  });
});

$(document).ready(function() {
  $(".owl-clients").owlCarousel({
    loop: true,
    margin: 40,
    responsiveClass: true,
    responsive: {
      0: {
        items: 1,
        nav: true
      },
      736: {
        items: 2,
        nav: false
      },
      1000: {
        items: 3,
        nav: true,
        loop: false
      }
    }
  });
});

$(function() {
  $(".navbar-toggler").click(function() {
    $("body").toggleClass("noscroll");
  });
});

$(window).on("scroll", function() {
  var scroll = $(window).scrollTop();

  if (scroll >= 80) {
    $("#site-header").addClass("nav-fixed");
  } else {
    $("#site-header").removeClass("nav-fixed");
  }
});

//Main navigation Active Class Add Remove
$(".navbar-toggler").on("click", function() {
  $("header").toggleClass("active");
});
$(document).on("ready", function() {
  if ($(window).width() > 991) {
    $("header").removeClass("active");
  }
  $(window).on("resize", function() {
    if ($(window).width() > 991) {
      $("header").removeClass("active");
    }
  });
});
