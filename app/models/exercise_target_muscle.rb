class ExerciseTargetMuscle < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :target_muscle

end
