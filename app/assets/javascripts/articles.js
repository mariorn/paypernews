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

