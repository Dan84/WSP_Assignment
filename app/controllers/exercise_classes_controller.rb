class ExerciseClassesController < ApplicationController
  def show
  	@exerciseclass = ExerciseClass.find(params[:id])
  end

  def index

  	@exerciseclasses = ExerciseClass.all
  end

  def create
  	secure_post = params.require(:exercise_class).permit(:name,:day,:duration)
        @exercise_class = current_user.exercise_classes.build(secure_post) 
        if @exercise_class.save
          flash[:success] = "Class created!"
          redirect_to root_url
      end

 
  	
  end

   def new
  	@exerciseclass = ExerciseClass.new
  end


end
