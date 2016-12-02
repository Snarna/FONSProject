var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

function responseErrMsg($msg){
  $("#responsediv").html($msg);
  $("#responsediv").show();
  $("#responsediv").addClass("animated shake");
  $("#responsediv").one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", function () {
      $("#responsediv").removeClass("animated shake");
  });
}

function fadeInElement(elm){
  $(elm).hide();
  $(elm).fadeIn();
}

function redBackgroundElm(elm){
  $(elm).animate({
    backgroundColor: "#ff2121"
  }, 200);
  $(elm).animate({
    backgroundColor: ""
  }, 200);
}

function greenBackgroundElm(elm){
  $(elm).animate({
    backgroundColor: "#42f442"
  }, 200);
  $(elm).animate({
    backgroundColor: ""
  }, 200);
}
