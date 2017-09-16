$(document).ready(function () {
 attachRunListeners();
 var wkHeader;
});


function attachRunListeners() {
  setRunDataUrl();
  editWorkout();
  showWorkoutHeader();
}

function Run(id, type, drills, duration, workout){
  this.id = id;
  this.type = type;
  this.drills = {};
  this.duration = duration;
  this.workout = workout
}

function setRunDataUrl() {
  $("#end-run").on('click',function (e) {
    var url = $(this).data("href"),
      data = {
      "run" : {
        "duration" : duration_seconds,
        "oneoff_name": wkHeader,
        "drills_attributes" : currentRun.drills
        }
      };
      createRun(url, data);
  })

}

function createRun(url, data) {
  $.ajax({
    type: 'POST',
    url: url,
    data: data,
    dataType: 'json',
    success:  function (data) {
      window.location.pathname = 'users/'+data.user_id+'/runs/'+data.id;
    },
    error: function() {
      console.log($.makeArray(arguments));
    }
  });
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
    $("#workout-run-input").val(wkHeader);
  });
}


function showWorkoutHeader() {
  $("#save-workout-name").on('click', function () {
    var wkInput = $("#workout-run-input").val();
    wkHeader = wkInput;
    $("#workout-run-input").hide();
    $("#workout-header").text(wkInput);
    $("#workout-header").show();
    $("#edit-workout-name").show();
    $("#save-workout-name").hide();
  })
}
