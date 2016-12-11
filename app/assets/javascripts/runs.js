$(document).ready(function () {
 attachRunListeners();
 var wkHeader;
});


function attachRunListeners() {
  setRunDataUrl();
  editWorkout();
  showWorkoutHeader();
}

function setRunDataUrl() {
  $("#end-run").on('click',function (e) {
    var url = $(this).data("href")
    var data = {
      "run" : {
        "duration" : duration_seconds
        }
      }
      updateRun(url, data);
  })

}

function updateRun(url, data) {
  $.ajax({
    url: url,
    type: 'PATCH',
    dataType: 'javascript',
    data: data
  })
}

function editWorkout() {
  $("#workout-run-input").hide();
  $("#save-workout-name").hide();
  wkHeader = $("#workout-header").text();
  $("#edit-workout-name").on('click', function () {
    $("#workout-header").hide();
    $("#edit-workout-name").hide();
    $("#workout-run-input").show();
    $("#save-workout-name").show();
    $("#workout-run-input").val(wkHeader)
  });
}


function showWorkoutHeader() {
  $("#save-workout-name").on('click', function () {
    var wkInput = $("#workout-run-input").val();
    wkHeader = wkInput;
    $("#workout-run-input").hide();
    $("#workout-header").text(wkInput)
    $("#workout-header").show();
    $("#edit-workout-name").show();
    $("#save-workout-name").hide();
  })
}
