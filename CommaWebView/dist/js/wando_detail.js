$(document).ready(function () {
  $(".slider").slick({ dots: true, arrows: false });

  let slickDots = $(".slick-dots");
  $(".slick-dots")[0].remove();

  $(".middle-view").prepend(slickDots);
});
