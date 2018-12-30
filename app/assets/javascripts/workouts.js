$(document).ready(function () {
 attachWorkoutListeners();
 var wkHeader;
});

function Workout(id = '', name = '', description = '', exercises = [], one_off = false){
  this.id = id;
  this.name = name;
  this.description = description;
  this.exercises = exercises;
  this.one_off = one_off;
}

function attachWorkoutListeners() {
  editWorkout();
  showWorkoutHeader();
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
