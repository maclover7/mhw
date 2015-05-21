$(function () {
  $('.edit_student_assignment input[type=submit]').remove();
  $('.edit_student_assignment input[type=checkbox]').click(function () {
    $(this).parent('form').submit();
  });
});
