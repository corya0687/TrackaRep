class RunSerializer < ActiveModel::Serializer
  attributes :id, :type, :duration, :exercise_id, :user_id, :run_date, :oneoff_name
  has_one :exercise
  has_many :drills
  has_many :target_muscles
end
