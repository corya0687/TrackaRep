class RunSerializer < ActiveModel::Serializer
  attributes :id, :type, :duration, :exercise_id, :user_id
  has_one :exercise
  has_many :drills
end
