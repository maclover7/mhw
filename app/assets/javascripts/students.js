// $(function(){
//  $('document').on 'click', '.edit_student_assignment input[type=checkbox]', ->
//    $(this).parent('form').submit();
//});


$(function () {
  $('.edit_student_assignment input[type=submit]').remove();
  $('.edit_student_assignment input[type=checkbox]').click(function () {
    // alert('clicked');
    $(this).parent('form').submit();
  });
});
