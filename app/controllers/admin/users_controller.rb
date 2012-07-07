class Admin::UsersController < Admin::AdminController
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      sign_in @user, bypass: true
      redirect_to admin_root_path, notice: "user updated"
    else
      redirect_to :back, alert: "errors"
    end
  end
end
