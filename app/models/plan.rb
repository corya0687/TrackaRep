class Plan < ActiveRecord::Base
  has_many :workout_plans
  has_many :plans, :through => :workout_plans
end
