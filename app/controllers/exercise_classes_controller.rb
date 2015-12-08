class ExerciseClassesController < ApplicationController
  before_filter :logged_in_user

  
  def show
  	@exerciseclass = ExerciseClass.find(params[:id])
  end

  def index

  	@exerciseclasses = ExerciseClass.all

    @classes_upcoming = ExerciseClass.upcoming.paginate(page: params[:upcoming])
    @classes_past = ExerciseClass.past.paginate(page: params[:past])
  end

  def create
  	#secure_post = params.require(:exercise_class).permit(:title,:description,:class_style_id,:class_level_id,:date)
        @exerciseclass = current_user.exercise_classes.build(secure_exclass) 
        if @exerciseclass.save
          flash[:success] = "Class created!"
          redirect_to @exerciseclass
        else
          
          render 'new'
        end  	
  end


  def new
  	@exerciseclass = ExerciseClass.new
    
  end

  def update
      @exerciseclass = ExerciseClass.find(params[:id])
      if @exerciseclass.update_attributes(secure_exclass)
         flash[:success] = "Class Updated"
         redirect_to article_path
      else
        render action: "edit"
      end
  end


  def edit
    @exerciseclass = ExerciseClass.find(params[:id])
  end

  def destroy

    ExerciseClass.find(params[:id]).destroy
        flash[:success] = "Class deleted"
        redirect_to allclasses_path
                  
 end


 def secure_exclass
      params.require(:exercise_class).permit(:title,:description,:class_style_id,:class_level_id,:date)
 end


end
