$(document).ready(function () {
 attachRunListeners();
});


function attachRunListeners() {
  setRunDataUrl();
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
