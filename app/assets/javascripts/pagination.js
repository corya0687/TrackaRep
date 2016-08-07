$(function () {
  $("#exercises").on("click", ".pagination a", function(){
    $(".pagination").html("Page is loading...");
    $.getScript(this.href,function () {
      displayExercises();
    });
    return false;
  });
});
