// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var uri = "http://localhost:3000/";

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


function controlEnter(e){
  if(e.which == 13){
    e.preventDefault();
    window.location.pathname = "/search/" + e.target.value;
  }
}

var increaseScore = function(value){

  var uri_array = window.location.pathname.split("/");
  var article_id = uri_array[ uri_array.length - 1];

  if(value > 0){
    $.ajax({
      url: uri + "increase_likes/" + article_id,
      success: function (response){
        $('#like-button').css('display','none');
        $('#no-like-button').css('display','block');
      }
    });//ajax

  }else{
      $.ajax({
        url: uri + "decrease_likes/" + article_id,
        success: function (response){
          $('#like-button').css('display','block');
          $('#no-like-button').css('display','none');
        }
      });//ajax
    }
}


var existIdReadLater = function(article_id){
  var pendings = JSON.parse(window.localStorage.getItem("pendings")) || [] ;

  for (var i = 0; i < pendings.length; i++) {
    if(pendings[i].id == article_id){
      return i;
    }
  }
  return -1;
};


var addArticle = function(e){
  e.preventDefault();
  var article_id = e.currentTarget.attributes.value.value;
  var that = this;

  $.ajax({
    url: uri + "read_after/" + article_id,
    success: function (response){

      var pendings = JSON.parse(window.localStorage.getItem("pendings")) || [] ;
      var position = existIdReadLater(article_id);
      if(position < 0){
        pendings.push({id: response.id, title: response.title});
        window.localStorage.setItem( "pendings" , JSON.stringify(pendings));
        $(that).attr("data-tooltip", "Leído");
        $(that).css("color","red");
      }else{
        pendings.splice(position , 1)
        window.localStorage.setItem( "pendings" , JSON.stringify(pendings));
        $(that).attr("data-tooltip", "Leer después");
        $(that).css("color","#039BE5");
      }
      renderArticlesReadLater();
    }
  });//ajax
};


var renderArticlesReadLater = function(e){
  var pendings = JSON.parse(window.localStorage.getItem("pendings")) || [] ;
  var parentPendings = $('#pending-read');
  $('#pending-read p').remove();

  for (var i = 0; i < pendings.length; i++) {
    var newArticleLater = $("<p><a class=\"check-later-read\" href=\"/articles/"+ pendings[i].id + "\">"+pendings[i].title+"</a></p>");
    $("#pending-read").append(newArticleLater);
  }
};

var removeArticle = function(e){
  var pendings = JSON.parse(window.localStorage.getItem("pendings")) || [] ;
  var parentPendings = $('#pending-read');
  $('#pending-read p').remove();

  var article_id = e.currentTarget.href.split("/");
  article_id = article_id[article_id.length-1];
  var pendings_def = [];
  for (var i = 0; i < pendings.length; i++) {
    if(pendings[i].id != article_id){
      pendings_def.push(pendings[i])
    }
  }
  window.localStorage.setItem( "pendings" , JSON.stringify(pendings_def));
  renderArticlesReadLater();
};



$(document).on('ready', function(){
  renderArticlesReadLater();
  $("#search").keyup(controlEnter);
  $('#datetimepicker').datetimepicker();
  $('#like-button').on('click', function(){increaseScore(1)});
  $('#no-like-button').on('click', function(){increaseScore(-1)});
  $('.button-read-after').on('click', addArticle);
  $('.check-later-read').on('click', removeArticle);
});
