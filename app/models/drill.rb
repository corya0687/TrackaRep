class Drill < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :run
end
