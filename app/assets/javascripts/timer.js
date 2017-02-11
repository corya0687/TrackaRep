$(document).ready(function () {
  attachRunListners();
})

var workout;
var currentExercise;
var exerciseIndex;
var exercises;

function attachRunListners() {
  loadWorkout();
  startExercise();
  endSet();
  hideRestTimer();
  hideNewExerciseFields();
}

function hideRestTimer() {
  $("#rest-timer-all").hide();
}

function toggleNewSetButton() {
  if (currentExercise.one_off === true) {
    $("#new-set-button").show();
  } else {
    $("#new-set-button").hide();
  }
}

function newRunExercise() {

}

function hideNewExerciseFields() {
  $('#new-exercise-button').hide()
  $("#new-exercise-run-table").hide()
  $('#start-new-exercise-button').hide()
  $('#cancel-new-exercise').hide()
}

function toggleNewExerciseButton() {
  var set = parseInt($("#current-set").text())
  if (currentExercise.sets == set && workout.one_off === true) {
    $("#new-exercise-button").show();
    toggleNewExerciseTable();
  } else {
    $("#new-exercise-button").hide();
  }
}


function startOneOffExercise() {

}

function toggleNewExerciseTable() {
  $("#new-exercise-button").on('click', function () {
    if ($("#new-exercise-run-table").is(":hidden")){
      $("#new-exercise-run-table").show();
      $('#start-new-exercise-button').show()
      $('#cancel-new-exercise').show()
      startNewExerciseListener();
      $("#new-exercise-button").hide()
    }
  })

  $("#cancel-new-exercise").on('click', function () {
    $('#new-exercise-run-table').hide();
    $('#start-new-exercise-button').hide();
    $('#cancel-new-exercise').hide();
    $('#new-exercise-button').show();
  })
}

function startExercise() {
  $("#start-run").on('click', function functionName() {
    durationTimer();
    $("#drill-fields").removeClass("drill-fields-pause")
    $("#drill-fields").toggleClass("drill-fields")
    $("#start-run").addClass("cant-click");
  });
}

function cancelWorkoutListener() {

}

function startNewSet() {
  $("#new-set").on('click', function () {
    currentExercise.sets += 1
    startRestTimer();
    event.preventDefault();
  });
}

function captureNewExercise(){
  newExerciseName = $('#new-exercise-name').val()
  newExerciseSets = $('#new-exercise-sets').val();
  newExerciseRest = $('#new-exercise-rest').val();
}

function startNewExerciseListener() {
  $('#start-new-exercise-button').on('click', function () {
    captureNewExercise();
    exercise = new Exercise('', newExerciseName, newExerciseSets, '', '','', newExerciseRest);
    exercise.one_off = true;
    workout.exercises.push(exercise);
    toggleNewSetButton();
    rest_seconds = 0;
    hideNewExerciseFields();
  });
}

function endSet() {
  $("#end-set").on('click', function (event) {
    toggleNewExerciseButton();
    startRestTimer();
    captureSetData();
    event.preventDefault();
  });
}

function startRestTimer() {
  restTimer();
  add15Secs();
  shorten30Secs();
}

function recordLastSet() {
  captureRestData();
  fillStatus();
  $("#drill-fields").toggleClass("drill-fields-pause");
  createDrillSet();
  actualRestTime = 0;
}

function incrementSet() {
  var set = parseInt($("#current-set").text())
  if (set >= currentExercise.sets) {
    set = 1;
    incrementExercise();
    $("#weight-input").val("")
    $("#rep-input").val("")
  } else {
    $("#current-set").text(set + 1)
    $("#weight-input").val("")
    $("#rep-input").val("")
  }
}

function incrementExercise(){
  exerciseIndex += 1;
  currentExercise = workout.exercises[exerciseIndex];
  displayExercise();
}

function captureSetData() {
  exerciseName = $("#set-exercise-name").text()
  setNumber = $("#current-set").text()
  weightInput = $("#weight-input").val()
  repInput = $("#rep-input").val()
}

function captureRestData() {
  restInput = actualRestTime;
}

function fillStatus() {
  $("#exercise-status-table tbody").append("<tr><td>"+exerciseName+"</td><td>"+setNumber+"</td><td>"+weightInput+"</td><td>"+repInput+"</td><td>"+restInput+"</td><td></td></tr>")
}

function Workout(id = '', name = '', description = '', exercises = [], one_off = false){
  this.id = id;
  this.name = name;
  this.description = description;
  this.exercises = exercises;
  this.one_off = one_off;
}

function loadWorkout() {
  var url = $("html")[0].baseURI
  var url = url.split("workouts/")
  pickWorkoutType(url);
}

function pickWorkoutType(url) {
  var oneOffUrl = url[0]
  if (url.length > 1){
    getWorkout(url);
  } else if ( oneOffUrl.includes('runs/new') ) {
    workout = new Workout;
    workout.one_off = true;
    exerciseIndex = 0;
    loadExercise(workout, oneOffUrl);
  }
}

  function loadExercise(workout, oneOffUrl) {
    var exerciseUrl = oneOffUrl.split('/exercises')
    var exercise_id = exerciseUrl[1].match(/\d+/)[0];
    $.get("/exercises/" +exercise_id+ ".json", function ( data ) {
      exercise = new Exercise(data.id, data.name, data.sets, data.reps, data.weight, data.rest_period, one_off = false);
      exercise = data;
      currentExercise = exercise;
      toggleNewSetButton();
      workout.exercises.push(exercise)
    });
  }

function getWorkout(url) {
  var workout_id = url[1].match(/\d+/)[0];
  $.get("/workouts/" +workout_id+ ".json", function ( data ) {
    workout = new Workout(data.id, data.name, data.description, data.exercises)
    exerciseIndex = 0;
    currentExercise = workout.exercises[exerciseIndex];
  });
}

function Exercise(id, name, sets = 1, reps, weight, rest_period, one_off = false) {
  this.id = id;
  this.name = name;
  this.sets = sets;
  this.reps = reps;
  this.weight = weight;
  this.rest_period = rest_period;
  this.one_off = one_off;
}

function displayExercise() {
  $("#set-exercise-name").text(currentExercise.name)
  $("#current-set").text(1)
}

function createDrillSet(event) {
  var data = {
    "drill" : {
      "set_number": setNumber,
      "weight": weightInput,
      "reps": repInput,
      "rest_period": restInput
    }
  }

  var url = $('#new_drill').attr('action')
debugger;
  $.ajax({
    url: url,
    method: 'POST',
    dataType: 'javascript',
    data: data,
    success: 'yes'})
}

var rest_seconds;
var duration_seconds
var countUp;
var countDown;
var setRestTimer;
var setNumber;
var weightInput;
var repInput;
var restInput;
var actualRestTime = 0;

function durationTimer() {
  duration_seconds = 0;
  setInterval('countUp()', 1000);
}


function swapTimerSet() {
  if ($("#rest-timer-all").is(":hidden")) {
    $("#rest-timer-all").show();
    $("#run-main").hide();
  } else if($("#run-main").is(":hidden")) {
    $("#rest-timer-all").hide();
    $("#run-main").show();
  }

}

function restTimer() {
  swapTimerSet();
  rest_seconds = currentExercise.rest_period;
  setRestTimer= setInterval('countDown()', 1000);
}

function countUp() {
  var minutes = Math.round((duration_seconds - 30)/60)
  var remainingSeconds = duration_seconds % 60;
  if (remainingSeconds < 10) {
    remainingSeconds = "0" + remainingSeconds;
  }
    $('#duration-timer').html(minutes + ":" + remainingSeconds);
    duration_seconds++;
}

// rest_timer - pull time from exercise, grab id from url.
function countDown() {
  var minutes = Math.round((rest_seconds - 30)/60)
  var remainingSeconds = rest_seconds % 60;
  if (remainingSeconds < 10) {
    remainingSeconds = "0" + remainingSeconds;
  }
  if (rest_seconds < 0) {
    swapTimerSet();
    incrementSet();
    clearInterval(setRestTimer);
    recordLastSet();
    $("#drill-fields").removeClass("drill-fields-pause");
  } else {
    $('#rest-timer').html(minutes + ":" + remainingSeconds);
    actualRestTime++;
    rest_seconds--;
  }
}

// add 15 secs to rest timer

function add15Secs () {
  $('#add-15-secs').on('click',function () {
    rest_seconds += 15;
  })
}

function shorten30Secs () {
  $('#shorten-rest').on('click',function () {
    rest_seconds -= 15
  })
}

function setTimerVars(seconds) {
  var minutes = Math.round((seconds - 30)/60)
  var remainingSeconds = seconds % 60;
  if (remainingSeconds < 10) {
    remainingSeconds = "0" + remainingSeconds;
  }
}

// start on Go
