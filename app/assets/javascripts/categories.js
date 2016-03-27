// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var checkSection = function(){
  if(window.location.pathname.indexOf('section') >= 0){
    var url = window.location.pathname.split('/');
    var cat = url[url.length - 1] - 1;
    $('.category-item')[cat].className += ' my-border-bottom';
  }
}

$(document).on('ready', function(){
  checkSection();
});
