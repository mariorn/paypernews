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
    if(myTitleCards[i].innerText.length > 70){
      myTitleCards[i].innerText = myTitleCards[i].innerText.substring(0,70) + '...';
    }
    if(myLeadCards[i].innerText.length > 300 ){
      myLeadCards[i].innerText = myLeadCards[i].innerText.substring(0,300) + '...';
    }
  }
}

function controlEnter(e){
  if(e.which == 13){
    e.preventDefault();
    window.location.pathname = "/search/" + e.target.value;
  }
}

var increaseScore = function(e){
  console.log(e);

  e.preventDefault();

  var uri = window.location.pathname.split("/");

  var article_id = uri[ uri.length - 1];
  console.log(article_id);

  $.ajax({
    url: "http://localhost:3000/increase_likes/" + article_id,
    success: function (response){

      var dataResponse = response;
      //Cambiar texto del botón y clase para que en caso de pulsar otra vez reste


    }
  });//ajax


}


$(document).on('ready', function(){

  filterCards();
  $("#search").keyup(controlEnter);
  $('#datetimepicker').datetimepicker();
  $('#like-button').on('click', increaseScore)


});
