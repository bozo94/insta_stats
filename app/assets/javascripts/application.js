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
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

// Login ajax event handlers
$(document).ready(function() {
  $('#sign_in_user')
  .bind('ajax:success', function(evt, data, status, xhr) {
    show_success();
  })
  .bind("ajax:error", function(evt, xhr, status, error) {
    show_error();
  });

  function show_success() {
    $('div.login-attempt-status').empty();
    $('div.login-attempt-status').append("You are now logged in.<br />Page will be refreshed in 2 seconds.");
    setTimeout(function(){
      location.reload();
    }, 2000);
  }

  function show_error() {
    $('div.login-attempt-status').empty();
    $('div.login-attempt-status').append("Your email or password is wrong.");
  }

});