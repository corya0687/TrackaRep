
$(document).ready(function () {
  attachListners();
})

function attachListners() {
  displayInputText();
  displayMuscleGroup();
  displayExercises();
}

function displayInputText() {
  $(".workout_fields").keypress(function (e) {
    var key = e.which;
    if(key == 13 || key == 9){
      $("#form-wo-name").text($("#workout_name").val());
      $("#form-wo-desc").text($("#workout_description").val());
      e.preventDefault();
    }
  });
}

function displayMuscleGroup() {
  $('[id^="workout_muscle_group_ids"]').click(function(event) {
    var fmg = $("#form-muscle-group").text()
    var idValue = ($("label[for="+ event.currentTarget.id + "]").text())

    removeMg(event);

    if(fmg.indexOf(idValue) < 0){
      $("#form-muscle-group").append($("label[for="+ event.currentTarget.id + "]").text())
    }
  });
}

function removeMg(event) {
  $("#"+event.currentTarget.id).on('change',function () {
    if(this.checked === false)
    var labelText = $("label[for="+ event.currentTarget.id + "]").text()
    $("#form-muscle-group").text($("#form-muscle-group").text().split(labelText).join(""))
  });
}

function displayExercises() {
  $('[id^="exercise_ids"]').click(function(event) {
    var exercise_id = $(this).val()
    var form_exer = $("#form-exercises").html()

    removeExercise(event);

    $.get("/exercises/"+exercise_id+".json", function( data ) {
      if (form_exer.indexOf("exer-row-"+exercise_id) < 0) {
        $("#form-exercises").append("<tr id=exer-row-"+exercise_id+"><td>"+data["name"]+"</td><td>"+data["rating"]+"</td><td>"+data["sets"]+"</td><td>"+data["weight"]+"</td><td>"+data["reps"]+"</td><td>"+data["rest_period"]+"</td></tr>")
        console.log("Request Complete")
      }
    });
  })
}

function removeExercise(event) {
  $("#"+event.currentTarget.id+event.currentTarget.value).on('change',function () {
    if(this.checked === false){
      $("#exer-row-" + event.currentTarget.value).remove();
    };
  });
}
