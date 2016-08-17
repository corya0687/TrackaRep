class RunSerializer < ActiveModel::Serializer
  attributes :id, :type, :duration, :exercise_id
  has_many :drills
end
