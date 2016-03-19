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
    if(myLeadCards[i].innerText.length > 70){
      myLeadCards[i].innerText = myLeadCards[i].innerText.substring(0,70) + '...';
    }
  }
}

function controlEnter(e){
  if(e.which == 13){
    e.preventDefault();
    console.log(e.target.value);

    window.location.pathname = "/search/" + e.target.value;
  }
}




$(document).on('ready', function(){

  filterCards();

  $("#search").keyup(controlEnter);

  $('#datetimepicker').datetimepicker();


});













