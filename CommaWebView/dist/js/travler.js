$("document").ready(function () {
  var MainSwiper = new Swiper(".main-swiper .swiper-container", {
    slidesPerView: 1,
    centeredSlides: true,
    effect: "fade",
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    pagination: {
      el: ".swiper-pagination",
      type: "fraction",
    },
  });
  var SubSwiper = new Swiper(".sub-swiper .swiper-container", {
    slidesPerView: 1,
    centeredSlides: true,
  });
  MainSwiper.controller.control = SubSwiper;
  SubSwiper.controller.control = MainSwiper;

  var SubSwiper = new Swiper(".bottom-swiper .swiper-container", {
    slidesPerView: 2,
    spaceBetween: 60,
    slidesOffsetAfter: 80,
    slidesOffsetBefore: 37,
  });
  $("#travler-detail").on("click", function () {
    location.href = "./travler_detail.html";
  });
});
