class ProfilesController < BaseController
  def edit
  end

  def update
    current_user.password = user_params[:password]
    if current_user.save
      redirect_to :new_user_session, notice: 'パスワードを変更した為、ログアウトしました'
    else
      render :edit 
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end