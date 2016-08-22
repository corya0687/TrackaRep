# Specifications for the Rails with jQuery Assessment

Specs:
- [X] Use jQuery for implementing new requirements
  + Used Jquery for requirements as well as form pages for exercises and workout resources.
- [X] Include a show page rendered using jQuery and an Active Model Serialization JSON backend.
  + Used show api end point for exercise model to show new and current exercise data in workout create and edit forms
- [X] Include an index page rendered using jQuery and an Active Model Serialization JSON backend.
  + Welcome index page, latest run uses Jquery to get Runs index for current user.
- [X ] Include at least one has_many relationship in information rendered via JSON
  + Has_many AMS relationship is used on welcome index page
- [X] Include at least one link that loads or updates a resource without reloading the page
  + Finish on Run updates the duration of Run without loading
- [X] Translate JSON responses into js model objects.
  + Used .ajax calls to return js model objects in welcome.js
- [X] At least one of the js model objects must have at least one method added by your code to the prototype.
  + added avg_weight() method to the prototype of run object in welcome.js.


Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
