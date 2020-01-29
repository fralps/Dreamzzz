// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

// ---------- TEMPLATE'S JS -----------

//= require jquery.min
//= require popper.min
//= require bootstrap

//= require aos
//= require clipboard
//= require jquery.fancybox.min
//= require flatpickr.min
//= require flickity.pkgd.min
//= require ion.rangeSlider.min
//= require isotope.pkgd.min
//= require jarallax.min
//= require jarallax-video.min
//= require jarallax-element.min
//= require jquery.countdown.min
//= require jquery.smartWizard.min
//= require plyr.polyfilled.min
//= require prism
//= require scrollMonitor
//= require smooth-scroll.polyfills.min
//= require twitterFetcher_min
//= require typed.min
//= require theme

// ----------- Charts ----------
//= require Chart.bundle
//= require chartkick

// ---------- Base JS -----------
//= require jquery
//= require rails-ujs
//= require activestorage
//= require_tree .

// ---------- THEME SCRIPTS ----------

// Removes page load animation when window is finished loading -->
window.addEventListener("load", function () {
	document.querySelector('body').classList.add('loaded');
});

// -------------- Personal JS ---------------

$(document).ready(function() {
	// Make an element disappear after a short time
	$('.delay_fadeout').delay(2750).fadeOut(400);
});

// Get the button
mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 700 || document.documentElement.scrollTop > 700) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}