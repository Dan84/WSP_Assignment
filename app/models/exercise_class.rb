class ExerciseClass < ActiveRecord::Base
	belongs_to :user
	has_many :class_bookings
	has_many :participants, :through => :class_bookings, :source => :user
end
