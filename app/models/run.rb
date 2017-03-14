class Run < ActiveRecord::Base
  has_many :timers
  belongs_to :exercise
  belongs_to :user
  belongs_to :workout
  has_many :target_muscles,  -> { distinct }
  has_many :drills, dependent: :destroy

  after_create :update_run_date

  accepts_nested_attributes_for :drills, :reject_if => :all_blank, :allow_destroy => true

  def drills_attributes=(drills_json)
    if !self.id.nil?
      drills_json.each do |index, drill|
          d = Drill.find(drill[:id])
          d.update_attributes(drill)
      end
    else
      set_target_muscles(drills_json) unless drills_json['1']['target_muscle_ids'].nil?
      drills_json.each do |index, drill|
        a = self.drills.build(drill)
      end
    end
  end

  def set_target_muscles(drills_json)
    drills_json.each do |drill, attrs|
      attrs[:target_muscle_ids].each do |tm_id|
        self.target_muscles << TargetMuscle.find(tm_id)
      end
    end
  end

  def avg_exercise_weight
    if self.drills > 0
      avg = self.drills.inject(0) do |sum, drill|
         sum + drill.weight if !drill.weight.nil?
       end
        avg = avg/self.drills.size unless avg.nil?
        avg
    end
  end

  def update_run_date
    self.run_date = self.created_at.strftime('%a %m/%d/%y')
    self.save
  end

  def active_one_off
    Workout.where(created_at: (Time.now - 3.hours)..Time.now).where(name:"One Off").first
  end
end
