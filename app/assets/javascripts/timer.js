$(document).ready(function () {
  attachRunListners();
})

function attachRunListners() {
  startExercise();
  endSet();
}

function startExercise() {
  $("#start-run").on('click', function functionName() {
    durationTimer();
    $("#drill-fields").removeClass("drill-fields-pause")
    $("#drill-fields").toggleClass("drill-fields")
  });
}

function endSet() {
  $("#end-set").on('click', function functionName(event) {
    restTimer();
    add15Secs();
    shorten30Secs();
    fillStatus();
    // createSet(event);
    event.preventDefault();
  });
}

function incrementSet() {
  let set = parseInt($("#current-set").text())
  $("#current-set").text(set + 1)
  $("#weight-input").val("")
  $("#rep-input").val("")
}

function fillStatus() {
  let setNumber = $("#current-set").text()
  let weightInput = $("#weight-input").val()
  let repInput = $("#rep-input").val()
  let restInput = $("#exercise-rest").text()
  $("#exercise-status-table tbody").append("<tr><td>"+setNumber+"</td><td>" +weightInput+"</td><td>"+repInput+"</td><td>"+restInput+"</td><td></td></tr>")
}

// function createSet(event) {
//   let data = {
//     $()
//   }
//
//   let url = $('#new_drill').attr('action')
//   $.ajax({
//     url: url,
//     method: 'POST',
//     dataType: 'javascript',
//     data:
//   })
// }

var rest_seconds;
var duration_seconds
var countUp;
var countDown;
var setRestTimer;

function durationTimer() {
  duration_seconds = 0;
  setInterval('countUp()', 1000);
}

function restTimer() {
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
    incrementSet();
    clearInterval(setRestTimer);
  } else {
    $('#rest-timer').html(minutes + ":" + remainingSeconds);
    rest_seconds--;
  }
}

// add 15 secs to rest timer

function add15Secs () {
  $('#add-15-secs').on('click',function () {
    rest_seconds += 15
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
