class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :exercises
end
