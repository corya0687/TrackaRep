class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name,:description,:reps,:author_id,:rest_period,:equipment_needed,:weight,:sets,:rating
end
