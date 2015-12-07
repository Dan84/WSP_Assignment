class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :edit,:update]
  before_action :correct_user,   only: [:edit, :update]

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

  	#secure_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)


  	@user = User.new(user_params)
  	if @user.save
      remember @user
      flash[:success] = "Welcome to the Twitter App!"    # NEW LINE
  		redirect_to @user
  	   else
		        render 'new'

	   end
  end

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end





  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end


    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end


    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end



end
