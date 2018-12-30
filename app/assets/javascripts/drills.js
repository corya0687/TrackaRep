function Drill(set_number, weight, reps, rest_period, exercise_name, target_muscle_ids) {
  this.set_number = set_number;
  this.weight = weight;
  this.reps = reps;
  this.rest_period = rest_period;
  this.exercise_name = exercise_name;
  this.target_muscle_ids = target_muscle_ids;
}

function addDrillToRun(event) {
  console.log('addDrillToRun:'+ currentExercise.target_muscle_ids)
  drill  = new Drill(setNumber, weightInput, repInput, restInput, exerciseName, targetMuscleIds);
  drillNum = Object.keys(currentRun.drills).length + 1;
  currentRun.drills[drillNum] = drill;
}
