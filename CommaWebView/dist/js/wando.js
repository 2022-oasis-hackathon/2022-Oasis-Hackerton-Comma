new fullpage("#fullpage", {
  //options here
  licenseKey: "gplv3-license",
  autoScrolling: true,
  scrollHorizontally: true,
  afterLoad() {
    $("body").css("height", "100vh");
  },
});

document.getElementsByClassName("fp-watermark")[0].remove();

function openCity(evt, cityName) {
  // Declare all variables
  var i, tabcontent, tablinks;

  // Get all elements with class="tabcontent" and hide them
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  // Get all elements with class="tablinks" and remove the class "active"
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  // Show the current tab, and add an "active" class to the button that opened the tab
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

$("#backgroundVideo").on("pause", function () {
  $("#backgroundVideo")[0].play();
});

$("#cource_1").on("click", function () {
  // TODO: event to ios
  location.href = "./wando_detail.html";
});
