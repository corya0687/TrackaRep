# Checklist of Outstanding features

* [] Core functionality
* [] Permissions

Permissions -
All Exercises are default viewable.
Admin can manage all resources
Coaches can edit user plans where they have been added as a coach,
 Only author, admins and user coaches can edit exercises.

* [] feature 2




1. ###Create models and associations###
Auto complete for muscle groups for exercises and type of workouts.

2.### Setup login/log out/sign up, home page and profile.###

3. ###Setup exercise controller and views- Allow full crud on### exercises.

Search for video on youtube and pic for muscle group automatically for exercises
Let user build custom workout with drop downs


#### Yoked 2.0 JQuery and Dashboard Functionality add. ###
1. Integrate SB Admin 2 Dashboard Theme
  -- Done
2. New workouts Page/Edit, New Exercise Page/Edit
  -- Done
4. Make sure all forms are working.
  -- Done
5. Build Run feature.
  Models:

  Run
  TotalDuration type asets areps aweight arest Completed_date

  Timer
  name secs
    Associations: belongs_to Run

  Run(@spartan_workout)
  timer(exercise_rest_period)

  Sprint Log-- currently working on getting exercise to run correctly, set is counting.

 Then create Form
6. Build index page.

Bugs-
1. Edit and New w validation errors workout forms-
 i. Field should have better way of avoiding fields_for exercises populating incorrectly on the edit and new page.

 ii.Check boxes in table not responding to workout js in right  -side panel div

 iii. Currently using hidden fields for associations in forms, should be done in controller. Or by using correct objects in forms

####Features
1. Shows plate combination based off desired weight


##Log
1. make Start Exercise Button start new exercise on one off workout.
