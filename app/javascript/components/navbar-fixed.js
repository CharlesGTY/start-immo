// When the user scrolls the page, execute myFunction
window.onscroll = function() {navFixed()};

// Get the navbar
var navbar = document.getElementById("navbar-fixed");
if (navbar) {
  // Get the offset position of the navbar
  var sticky = navbar.getBoundingClientRect().top;
  var width = navbar.clientWidth;
  console.log(width)

  // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
  function navFixed() {
    if (window.pageYOffset >= sticky) {
      navbar.classList.add("sticky")
      navbar.style.width = `${width}px`;
    } else {
      navbar.classList.remove("sticky");
    }
  }
}

export {navFixed};
