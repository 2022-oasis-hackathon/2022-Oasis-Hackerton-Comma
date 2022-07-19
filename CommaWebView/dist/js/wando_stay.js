$("document").ready(function () {
  new Swiper(".main-swiper .swiper-container", {
    slidesPerView: 1.2,
    centeredSlides: true,
    spaceBetween: 10,
  });
});

$("#wando_stay_detail").on("click", function () {
  location.href = "./wando_stay_detail";
});
