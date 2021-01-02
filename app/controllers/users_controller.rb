class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # log_in @user
      session[:user_id] = @user.id
      flash[:notice] = "登録しました"
      redirect_to root_path
    else
      render login_path
    end
  end

  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end  


end
