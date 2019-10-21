function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  var expires = "expires=" + d.toGMTString();
  console.log("Setting cookie: " + cname + "=" + cvalue + ";" + expires + ";path=/");
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) === 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

function checkCookie(cookieName) {
  var cookie=getCookie(cookieName);
  if (cookie !== "") {
    return true;
  }
  return false;
}

function setLocale() {
  var locale = document.getElementById("localeSel").value;
  if (locale != getCookie("locale")) {
    setCookie("locale", locale, 30);
    document.location="/" + locale + "/" + location.href.split('/').pop();
  }
}

function manageLocale() {
  // Get the locale cookie; if not set default to en.
  console.log("manageLocale()");
  var locale = getCookie("locale");
  if (locale == null) {
    locale="en";
    setCookie("locale", locale, 30);
  }

  console.log("Locale cookie is " + locale);

  // Set the selector default to the value in the cookie
  var localeSel = document.getElementById('localeSel');
  for (var i, j = 0; i = localeSel.options[j]; j++) {
    if (i.value == locale) {
      localeSel.selectedIndex = j;
      break;
    }
  }
}
