class ExerciseClass < ActiveRecord::Base
	belongs_to :user
	belongs_to :class_style
	belongs_to :class_level
	has_many   :class_bookings
	has_many   :participants, :through => :class_bookings, :source => :user

	validates  :user_id, presence: true
	validates  :class_style_id, presence: true 
    validates  :class_level_id, presence: true 
    validates  :title, presence: true, length: { maximum: 50 }
  	validates  :description, presence: true
  	validates  :date , presence: true 
end
