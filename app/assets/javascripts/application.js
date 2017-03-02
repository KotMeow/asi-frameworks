// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var colors = ['is-primary', 'is-info', 'is-danger', 'is-warning', 'is-success', 'is-primary is-bold', 'is-success is-bold', 'is-warning is-bold', 'is-danger is-bold', 'is-info is-bold'];
var borderColors = ['hsl(171, 100%, 41%)', 'hsl(217, 71%, 53%)', 'hsl(348, 100%, 61%)'
                       , 'hsl(48, 100%, 67%)', 'hsl(141, 71%, 48%)', 'hsl(171, 100%, 41%)', 'hsl(141, 71%, 48%)', 'hsl(48, 100%, 67%)', 'hsl(348, 100%, 61%)', 'hsl(217, 71%, 53%)']
$(window).scroll(function () {
    if ($(this).scrollTop() >= 500) {
        $(".Top").fadeIn();
    }
    else {
        $(".Top").fadeOut();
    }
});