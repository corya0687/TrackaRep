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
}

function hideRestTimer() {
  $("#rest-timer-all").hide();
}

function startExercise() {
  $("#start-run").on('click', function functionName() {

    durationTimer();
    $("#drill-fields").removeClass("drill-fields-pause")
    $("#drill-fields").toggleClass("drill-fields")
    $("#start-run").addClass("cant-click");
  });
}



function endSet() {
  $("#end-set").on('click', function functionName(event) {

    restTimer();
    add15Secs();
    shorten30Secs();
    captureSetData();
    fillStatus();
    $("#drill-fields").toggleClass("drill-fields-pause");
    //$("#run-main").html($("#rest-timer-all").html())

    createSet();
    event.preventDefault();
  });
}

function incrementSet() {
  var set = parseInt($("#current-set").text())
  if (set >= currentExercise.sets) {
    set = 1;
    incrementExercise();
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
  setNumber = $("#current-set").text()
  weightInput = $("#weight-input").val()
  repInput = $("#rep-input").val()
  restInput = $("#exercise-rest").text()
}

function fillStatus() {
  $("#exercise-status-table tbody").append("<tr><td>"+setNumber+"</td><td>" +weightInput+"</td><td>"+repInput+"</td><td>"+restInput+"</td><td></td></tr>")
}

function Workout(id, name, description, exercises){
  this.id = id;
  this.name = name;
  this.description = description;
  this.exercises = exercises;
}

function loadWorkout() {
  var url = $("html")[0].baseURI
  var url = url.split("workouts/")
  var workout_id = url[1].match(/\d/)[0];
  $.get("/workouts/" +workout_id+ ".json", function ( data ) {
    workout = new Workout(data.id, data.name, data.description, data.exercises)
    exerciseIndex = 0;
    currentExercise = workout.exercises[exerciseIndex];
  });
}

function Exercise(id, name, sets, reps, weight, rest_period) {
  this.id = idea;
  this.name = name;
  this.sets = sets;
  this.reps = reps;
  this.weight = weight;
  this.rest_period = rest_period;
}



function displayExercise() {
  $("#set-exercise-name").text(currentExercise.name)
  $("#current-set").text(1)
}

function createSet(event) {
  var data = {
    "drill" : {
      "set_number": setNumber,
      "weight": weightInput,
      "reps": repInput,
      "rest_period": restInput
    }
  }

  var url = $('#new_drill').attr('action')
  $.ajax({
    url: url,
    method: 'POST',
    dataType: 'javascript',
    data: data,
    success: console.log(data)
  })
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
  rest_seconds = $("#exercise-rest").text()
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
    $("#drill-fields").removeClass("drill-fields-pause")

  } else {
    $('#rest-timer').html(minutes + ":" + remainingSeconds);
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
