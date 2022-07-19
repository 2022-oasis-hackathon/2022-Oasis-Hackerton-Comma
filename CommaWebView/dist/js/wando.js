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
  console.log("asdf");
  try {
    webkit.messageHandlers.scriptHandler.postMessage("wando_detail");
  } catch (error) {
    alert(error);
  }
});

let observer = new MutationObserver((mutations) => {
  // 노드가 변경 됐을 때의 작업
  if ($(".fp-viewing-cource")[0] == undefined) {
    $(".over-scroll-box").css("display", "flex");
  } else {
    $(".over-scroll-box").css("display", "none");
  }
});

// 감시자의 설정
let option = {
  attributes: true,
};

observer.observe(document.querySelector("#fullpage"), option);

$("#taste").on("click", function () {
  $("#taste-img").attr("src", "../images/two_select.png");
  $("#stay-img").attr("src", "../images/one_not.png");
  $("#first-img").attr("src", "../images/one-not-select.png");
  $("#second-img").attr("src", "../images/two-img.png");
  $("#second-img").animate({ width: "50vw", flex: "2" });
  $("#first-img").animate({ width: "16vw", flex: "1" });
});

$("#stay").on("click", function () {
  $("#taste-img").attr("src", "../images/two_not.png");
  $("#stay-img").attr("src", "../images/one_select.png");
  $("#first-img").attr("src", "../images/one-img.png");
  $("#second-img").attr("src", "../images/two-not-select.png");
  $("#first-img").animate({ width: "50vw", flex: "2" });
  $("#second-img").animate({ width: "16vw", flex: "1" });
});

$("#first-img").on("click", function () {
  location.href = "./wando_stay.html";
});
