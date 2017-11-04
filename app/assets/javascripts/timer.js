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

function hideNewExerciseFields() {
  $('#new-exercise-button').hide()
  $("#new-exercise-run-table").hide()
  $('#start-new-exercise-button').hide()
  $('#cancel-new-exercise').hide()
}

function toggleNewExerciseButton() {
  var set = parseInt($("#current-set").text());
  if (currentExercise.sets == set && workout.one_off === true) {
    $("#new-exercise-button").show();
    toggleNewExerciseTable();
  } else {
    $("#new-exercise-button").hide();
  }
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
    currentRun = new Run('','', {}, 0,'');
    $("#drill-fields").removeClass("drill-fields-pause")
    $("#drill-fields").toggleClass("drill-fields")
    $("#start-run").addClass("cant-click");
  });
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
  tmIdsNode = $('.new-ex-tms:checkbox:checked');
  newExerciseTmIds = [];
  tmIdsNode.each(function( i ) {
    newExerciseTmIds.push(parseInt(tmIdsNode[i].value))
  });
}

function emptyNewExercise() {
  $('#new-exercise-name').val('');
  $('#new-exercise-sets').val('');
  $('#new-exercise-rest').val('');
}

function startNewExerciseListener() {
  $('#start-new-exercise-button').on('click', function () {
    captureNewExercise();
    emptyNewExercise();
    exercise = new Exercise('', newExerciseName, newExerciseSets, '', '', newExerciseRest, true, newExerciseTmIds);
    console.log('New Exercise')
    workout.exercises.push(exercise);
    rest_seconds = 0;
    hideNewExerciseFields();
    $('#start-new-exercise-button').off()
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
  shorten15Secs();
}

function recordLastSet() {
  captureRestData();
  fillStatus();
  $("#drill-fields").toggleClass("drill-fields-pause");
  addDrillToRun();
  actualRestTime = 0;
}

function incrementSet() {
  var set = parseInt($("#current-set").text())
  if (set >= currentExercise.sets) {
    if (workout.exercises.length > exerciseIndex + 1){
      set = 1;
      incrementExercise();
      $("#weight-input").val("")
      $("#rep-input").val("")
    }else{
    recordLastSet();
    $('#end-run').trigger('click');
    }
  } else {
    $("#current-set").text(set + 1)
    $("#weight-input").val("")
    $("#rep-input").val("")
  }
}

// add new set feature

// function addSet(set) {
//   if (currentExercise.sets == set)
//   toggleNewSetButton();
// }

// function toggleNewSetButton() {
//   if (currentExercise.one_off === true) {
//     $("#new-set-button").show();
//   } else {
//     $("#new-set-button").hide();
//   }
// }

function incrementExercise(){
    exerciseIndex += 1;
    console.log('IncrementExercise')
    currentExercise = workout.exercises[exerciseIndex];
    displayExercise();
}

function captureSetData() {
  exerciseName = $("#set-exercise-name").text();
  setNumber = $("#current-set").text();
  weightInput = $("#weight-input").val();
  repInput = $("#rep-input").val();
  targetMuscleIds = currentExercise.target_muscle_ids;
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
  var url = $("html")[0].baseURI,
    url = url.split("workouts/");
  pickWorkoutType(url);
}

function pickWorkoutType(url) {
  var oneOffUrl = url[0]
  if (url.length > 1){
    getWorkout(url);
  } else if ( oneOffUrl.includes('runs/new') ) {
    workout = new Workout( ' ', "untitled");
    workout.one_off = true;
    currentWorkout = workout;
    exerciseIndex = 0;
    loadExercise(workout, oneOffUrl);
  }
}

  function loadExercise(workout, oneOffUrl) {
    var exerciseUrl = oneOffUrl.split('/exercises'),
      exercise_id = exerciseUrl[1].match(/\d+/)[0];
    $.get("/exercises/" +exercise_id+ ".json", function ( data ) {
      var tmOldIds = data.target_muscles.map(function (e) {
        return e.id
      })
      exercise = new Exercise(data.id, data.name, data.sets, data.reps, data.weight, data.rest_period, one_off = false, tmOldIds);
      currentExercise = exercise;
      workout.exercises.push(exercise)
    });
  }

function getWorkout(url) {
  var workout_id = url[1].match(/\d+/)[0];
  $.get("/workouts/" +workout_id+ ".json", function ( data ) {
    workout = new Workout(data.id, data.name, data.description, data.exercises)
    currentRun.workout = workout;
    exerciseIndex = 0;
    currentExercise = workout.exercises[exerciseIndex];
  });
}

function Exercise(id, name, sets = 1, reps, weight, rest_period, one_off, tmIds) {
  this.id = id;
  this.name = name;
  this.sets = sets;
  this.reps = reps;
  this.weight = weight;
  this.rest_period = rest_period;
  this.one_off = one_off;
  this.target_muscle_ids = tmIds;
}

function Drill(set_number, weight, reps, rest_period, exercise_name, target_muscle_ids) {
  this.set_number = set_number;
  this.weight = weight;
  this.reps = reps;
  this.rest_period = rest_period;
  this.exercise_name = exercise_name;
  this.target_muscle_ids = target_muscle_ids;
}

function displayExercise() {
  $("#set-exercise-name").text(currentExercise.name);
  $("#current-set").text(1);
}

function addDrillToRun(event) {
  console.log('addDrillToRun:'+ currentExercise.target_muscle_ids)
  drill  = new Drill(setNumber, weightInput, repInput, restInput, exerciseName, targetMuscleIds);
  drillNum = Object.keys(currentRun.drills).length + 1;
  currentRun.drills[drillNum] = drill;
}

var rest_seconds,
  duration_seconds,
  countUp,
  countDown,
  setRestTimer,
  setNumber,
  weightInput,
  repInput,
  restInput,
  actualRestTime = 0,
  restBeep = new Audio('/assets/Beep.mp3'),
  startBeep = new Audio ('/assets/start-bell.mp3');

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
    startBeep.play();
    removeRestLisners();
  }
}

function removeRestLisners() {
  $('#shorten-rest').off();
  $('#add-15-secs').off();
}

function restTimer() {
  swapTimerSet();
  rest_seconds = currentExercise.rest_period;
  setRestTimer= setInterval('countDown()', 1000);
}

function countUp() {
  var minutes = Math.round((duration_seconds - 30)/60),
    remainingSeconds = duration_seconds % 60;
  if (remainingSeconds < 10) {
    remainingSeconds = "0" + remainingSeconds;
  }
    $('#duration-timer').html(minutes + ":" + remainingSeconds);
    duration_seconds++;
}

// rest_timer - pull time from exercise, grab id from url.
function countDown() {
  var minutes = Math.round((rest_seconds - 30)/60),
    remainingSeconds = rest_seconds % 60;
  if (remainingSeconds < 10) {
    remainingSeconds = "0" + remainingSeconds;
  }
  if (rest_seconds < 0) {
    if ($('#start-new-exercise-button').is(":visible")) {
      $('#start-new-exercise-button').trigger("click")
    }
    swapTimerSet();
    incrementSet();
    clearInterval(setRestTimer);
    recordLastSet();
    $("#drill-fields").removeClass("drill-fields-pause");
  } else {
    $('#rest-timer').html(minutes + ":" + remainingSeconds);
    actualRestTime++;
    if (rest_seconds < 5){
      if(restBeep.duration > 0 && !restBeep.paused){
        restBeep.pause();
        restBeep.currentTime = 0;
        restBeep.play();
      }else{
        restBeep.play();
      }
    }

    rest_seconds--;
  }
}

// add 15 secs to rest timer

function add15Secs () {
  $('#add-15-secs').on('click',function () {
    rest_seconds += 15;
  })
}

function shorten15Secs () {
  $('#shorten-rest').on('click',function () {
    rest_seconds -= 15;
  })
}

function setTimerVars(seconds) {
  var minutes = Math.round((seconds - 30)/60),
    remainingSeconds = seconds % 60;
  if (remainingSeconds < 10) {
    remainingSeconds = "0" + remainingSeconds;
  }
}

// start on Go
