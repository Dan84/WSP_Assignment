class UsersController < ApplicationController

	def show
        @user = User.find(params[:id])
       # @articles = @user.articles.paginate(page: params[:page])
      end

  def index

    if(current_user.trainer?)
     @users = User.all
    else
      @users = User.where("trainer" => true)
    end

  end
      
  def new
  	@user = User.new
  end





  def create

  	secure_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)


  	@user = User.new(secure_params)
  	if @user.save
      remember @user
      flash[:success] = "Welcome to the Twitter App!"    # NEW LINE
  		redirect_to @user
  	   else
		        render 'new'

	   end
  end



end
