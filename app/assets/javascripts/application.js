//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require select2
//= require bootstrap-datepicker
//= require_tree .



  $(document).on("page:change ready", function(){
    $('input.datepicker').datepicker();
  });




$('#brand_select').select2({
  selectOnClose: true
});

$('#category_select').select2({
  selectOnClose: true
});

$('#condition_select').select2({
  selectOnClose: true
});
