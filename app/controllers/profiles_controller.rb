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
end
