class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :coach, :admin]

  has_many :exercises, :foreign_key => 'author_id'
  has_many :plans
  has_many :workouts, through: :plans, :source => :workout_plans

  def exercise_creators
    User.joins(:exercises).group("users.id").having("COUNT(*) > 0").select("users.username")
  end
end
