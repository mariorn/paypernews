// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(function() {
    $(".browser-default").on('change', function(event) {
      console.log(event.currentTarget.value);
        $('#select-form').val(event.currentTarget.value);

        // re-initialize material-select
        $('#select-form').material_select();
    });
});



$(".hover").mouseleave(
    function () {
      $(this).removeClass("hover");
    }
);


var filterCards = function(){
  var myTitleCards = $('.my-card-title');
  var myLeadCards = $('.my-card-lead');

  for (var i = 0; i < myTitleCards.length; ++i) {
    if(myTitleCards[i].innerText.length > 60){
      myTitleCards[i].innerText = myTitleCards[i].innerText.substring(0,60) + '...';
    }
    if(myLeadCards[i].innerText.length > 50){
      myLeadCards[i].innerText = myLeadCards[i].innerText.substring(0,50) + '...';
    }
  }
}




$(document).on('ready', function(){

  filterCards();




});
