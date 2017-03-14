class DrillSerializer < ActiveModel::Serializer
  attributes :id , :run_id, :weight, :reps, :rest_period, :set_number, :exercise_name
  has_one :exercise
end
