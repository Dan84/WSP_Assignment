class UsersController < ApplicationController

	def show
        @user = User.find(params[:id])
      end

  def index
    @users = User.all
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