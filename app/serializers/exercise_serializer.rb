class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name,:description,:reps,:author_id,:rest_period,:equipment_needed,:weight,:sets,:rating
  has_many :target_muscles
end
