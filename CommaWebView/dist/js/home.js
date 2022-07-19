$("document").ready(function () {
  var MainSwiper = new Swiper(".main-swiper .swiper-container", {
    slidesPerView: 1,
    centeredSlides: true,
  });
  var SubSwiper = new Swiper(".sub-swiper .swiper-container", {
    slidesPerView: 1,
    centeredSlides: true,
  });
  MainSwiper.controller.control = SubSwiper;
  SubSwiper.controller.control = MainSwiper;

  var CitySwiper = new Swiper(".mySwiper", {
    spaceBetween: 20,
    slidesPerView: 5,
    loop: false,
    freeMode: false,
    slidesOffsetBefore: 20,
    slidesOffsetAfter: 20,
  });

  $("#wando").on("click", function () {
    try {
      webkit.messageHandlers.scriptHandler.postMessage("wando");
    } catch (error) {
      alert(error);
    }
  });
});
