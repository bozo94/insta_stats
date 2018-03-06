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
//= require loading_bar.min
//= require countUp
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

$(document).ready(function(){
  $('img.user-placeholder').each(function(i, item) {
    var img_height = $(item).height();
    var div_height = $(item).parent().height();
    if(img_height<div_height){
      //INCREASE HEIGHT OF IMAGE TO MATCH CONTAINER
      $(item).css({'width': 'auto', 'height': div_height });
      //GET THE NEW WIDTH AFTER RESIZE
      var img_width = $(item).width();
      //GET THE PARENT WIDTH
      var div_width = $(item).parent().width();
      //GET THE NEW HORIZONTAL MARGIN
      var newMargin = (div_width-img_width)/2+'px';
      //SET THE NEW HORIZONTAL MARGIN (EXCESS IMAGE WIDTH IS CROPPED)
    $(item).css({'margin-left': newMargin });
    }else{
      //CENTER IT VERTICALLY (EXCESS IMAGE HEIGHT IS CROPPED)
      var newMargin = (div_height-img_height)/2+'px';
      $(item).css({'margin-top': newMargin});
    }
  });
})
