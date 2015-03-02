class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in @user
      flash[:success] = "Welcome #{@user.name}!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
		@user = User.find(params[:id])
	end

  private

    def user_params
      params.require(:user).permit(:name, 
                                   :password,
                                   :password_confirmation)
    end
end