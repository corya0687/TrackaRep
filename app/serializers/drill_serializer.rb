class DrillSerializer < ActiveModel::Serializer
  attributes :id , :run_id, :weight, :reps, :rest_period, :set_number
  has_one :exercise
end
