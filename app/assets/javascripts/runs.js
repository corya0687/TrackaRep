$(document).ready(function () {
 attachRunListeners();
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
  $("#edit-workout-name").on('click', function () {
    $("#workout-header").hide();
    $("#edit-workout-name").hide();
    $("#workout-run-input").show();
    $("#save-workout-name").show();

  });
}

function showWorkoutHeader() {
  $("#save-workout-name").on('click', function () {
    $("#workout-run-input").hide();
    $("#workout-header").show();
    $("#edit-workout-name").show();
    $("#save-workout-name").hide();
  })
}
