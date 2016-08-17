'use strict';

var runs;
$(function () {
  recentRuns();

});



function recentRuns() {
    let user_id = $("#see-all-ran").attr("href").match(/\d+/)[0]
    $.get('/users/'+user_id+'/runs.json',function (response) {
      console.log(response)
      runs = response;
    }).done(function () {
      addRunsToWelcome(runs);
    });
}

function addRunsToWelcome(runs) {
  runs.forEach(function (run) {
    displayRun(run);
  });
}


function displayRun(run) {
  $("#recent-runs").append("<tr id="+run.id+"><td>"+run.exercise.name+"</td><td>"+run.exercise.sets+"</td><td></td><td>"+run.duration+"</td></tr>")
}
