class ProfilesController < BaseController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to :new_user_session, notice: 'パスワードが変更されたためログアウトします'
    else
      render :edit, status: :unprocessable_entry
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end