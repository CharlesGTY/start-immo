var navbar = document.getElementById("navbar-fixed");

if (navbar) {
  window.onscroll = function() {navFixed()};
  var sticky = navbar.getBoundingClientRect().top;
  var width = navbar.clientWidth;
}

function navFixed() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
    navbar.style.width = `${width}px`;
  } else {
    navbar.classList.remove("sticky");
  }
}

export {navFixed};

