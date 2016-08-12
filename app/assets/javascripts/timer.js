$(document).ready(function () {
  attachRunListners();
})

function attachRunListners() {
  durationTimer();
  restTimer();
  add15Secs();
}

var rest_seconds;
var duration_seconds
var countUp;
var countDown;

function durationTimer() {
  duration_seconds = 0;
  setInterval('countUp()', 1000);
}

function restTimer() {
  rest_seconds = 500;
  setInterval('countDown()', 1000);
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
    $('#rest-timer').html(minutes + ":" + remainingSeconds);
    rest_seconds--;


}

// add 15 secs to rest timer

function add15Secs () {
  $('#add-15-secs').on('click',function () {
    rest_seconds += 15
  })
}
// start on Go
