// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// var uri = "http://localhost:3000/";

var uri = window.location.host + "/";

jQuery(function ($) {
  var show_error, stripeResponseHandler;
  $("#new_registration").submit(function (event) {
    var $form;
    $form = $(this);
    $form.find("input[type=submit]").prop("disabled", true);
    Stripe.card.createToken($form, stripeResponseHandler);
    return false;
    });
});

function generateReportsReader (days, chart){

  var path_array = window.location.pathname.split("/");
  var user_id = path_array[path_array.length - 1 ];

  $.ajax({
    url: uri + "read_by_week/" + user_id + "/" + days,
    success: function (response){

      var dataResponse = response;

      var data = {
          labels: ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"],
          datasets: [
              {
                  label: "Última semana",
                  fillColor: "rgba(220,220,220,0.2)",
                  strokeColor: "rgba(220,220,220,1)",
                  pointColor: "rgba(220,220,220,1)",
                  pointStrokeColor: "#fff",
                  pointHighlightFill: "#fff",
                  pointHighlightStroke: "rgba(220,220,220,1)",
                  data: [response["Monday"]["total"],
                        response["Tuesday"]["total"],
                        response["Wednesday"]["total"],
                        response["Thursday"]["total"],
                        response["Friday"]["total"],
                        response["Saturday"]["total"],
                        response["Sunday"]["total"]
                      ]
              },
              {
                  label: "Datos globales",
                  fillColor: "rgba(151,187,205,0.2)",
                  strokeColor: "rgba(151,187,205,1)",
                  pointColor: "rgba(151,187,205,1)",
                  pointStrokeColor: "#fff",
                  pointHighlightFill: "#fff",
                  pointHighlightStroke: "rgba(151,187,205,1)",
                  data: [response["Monday"]["total_price"],
                        response["Tuesday"]["total_price"],
                        response["Wednesday"]["total_price"],
                        response["Thursday"]["total_price"],
                        response["Friday"]["total_price"],
                        response["Saturday"]["total_price"],
                        response["Sunday"]["total_price"]
                      ]
              }
          ]
      };

      var ctx_reader = document.getElementById(chart).getContext("2d");
      var readerChart = new Chart(ctx_reader).Radar(data, options);
      var element = document.createElement("h4");
      element.innerHTML = "Artículos comprados los "+days+" últimos días";
      document.getElementById("js-"+chart).appendChild(element);
    }, //success
    dataType: 'json'
  });//ajax

};

function generateReportsWriter (days, chart){

  var path_array = window.location.pathname.split("/");
  var user_id = path_array[path_array.length - 1 ];

  $.ajax({
    url: uri + "write_by_week/" + user_id + "/" + days,
    success: function (response){

      var dataResponse = response;

      var data = {
          labels: ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"],
          datasets: [
              {
                  label: "Última semana",
                  fillColor: "rgba(220,220,220,0.2)",
                  strokeColor: "rgba(220,220,220,1)",
                  pointColor: "rgba(220,220,220,1)",
                  pointStrokeColor: "#fff",
                  pointHighlightFill: "#fff",
                  pointHighlightStroke: "rgba(220,220,220,1)",
                  data: [response["Monday"]["total"],
                        response["Tuesday"]["total"],
                        response["Wednesday"]["total"],
                        response["Thursday"]["total"],
                        response["Friday"]["total"],
                        response["Saturday"]["total"],
                        response["Sunday"]["total"]
                      ]
              },
              {
                  label: "Datos globales",
                  fillColor: "rgba(151,187,205,0.2)",
                  strokeColor: "rgba(151,187,205,1)",
                  pointColor: "rgba(151,187,205,1)",
                  pointStrokeColor: "#fff",
                  pointHighlightFill: "#fff",
                  pointHighlightStroke: "rgba(151,187,205,1)",
                  data: [response["Monday"]["total_price"],
                        response["Tuesday"]["total_price"],
                        response["Wednesday"]["total_price"],
                        response["Thursday"]["total_price"],
                        response["Friday"]["total_price"],
                        response["Saturday"]["total_price"],
                        response["Sunday"]["total_price"]
                      ]
              }
          ]
      };

      var ctx_writer = document.getElementById(chart).getContext("2d");
      var writerChart = new Chart(ctx_writer).Radar(data, options);
      var element = document.createElement("h4");
      element.innerHTML = "Artículos vendidos los "+days+" últimos días";
      document.getElementById("js-"+chart).appendChild(element);
    }, //success
    dataType: 'json'
  });//ajax



};

var generateReports = function(e){
  generateReportsReader(7, "readerArticlesWeek");
  generateReportsWriter(7, "writerArticlesWeek");
  generateReportsReader(30, "readerArticlesMonth");
  generateReportsWriter(30, "writerArticlesMonth");
  generateReportsReader(365, "readerArticlesYear");
  generateReportsWriter(365, "writerArticlesYear");
};


$(document).on('ready', function(){
  $('#reports-generate').on('click', generateReports);
});




var options = {
  //Boolean - Whether to show lines for each scale point
  scaleShowLine : true,

  //Boolean - Whether we show the angle lines out of the radar
  angleShowLineOut : true,

  //Boolean - Whether to show labels on the scale
  scaleShowLabels : false,

  // Boolean - Whether the scale should begin at zero
  scaleBeginAtZero : true,

  //String - Colour of the angle line
  angleLineColor : "rgba(0,0,0,.1)",

  //Number - Pixel width of the angle line
  angleLineWidth : 1,

  //String - Point label font declaration
  pointLabelFontFamily : "'Arial'",

  //String - Point label font weight
  pointLabelFontStyle : "normal",

  //Number - Point label font size in pixels
  pointLabelFontSize : 10,

  //String - Point label font colour
  pointLabelFontColor : "#666",

  //Boolean - Whether to show a dot for each point
  pointDot : true,

  //Number - Radius of each point dot in pixels
  pointDotRadius : 3,

  //Number - Pixel width of point dot stroke
  pointDotStrokeWidth : 1,

  //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
  pointHitDetectionRadius : 20,

  //Boolean - Whether to show a stroke for datasets
  datasetStroke : true,

  //Number - Pixel width of dataset stroke
  datasetStrokeWidth : 2,

  //Boolean - Whether to fill the dataset with a colour
  datasetFill : true,

  //String - A legend template
  legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"

};
