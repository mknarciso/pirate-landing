class UsersController < ApplicationController
  def show 
    @users = current_user
  end
  
  def newPreRegister
    require_admin
    @user=User.new
  end
  
  def preregister
    if is_admin
      @user = User.pre_registration(pre_user_params, 'origin')
      if @user.save
        # Handle a successful save.
      else
        render 'pre_registration'
      end
    redirect_to root_path
    end
  end
  
  def newRegister
      @user = User.new
  end
  
  def register
    user = User.registration(user_params, 'origin')
    session[:user_id] = user.id
    redirect_to root_path
  end
  
  
  private
  def pre_user_params
    params.require(:user).permit(:name, :email)
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :urlImage, :username)
  end
  
end
