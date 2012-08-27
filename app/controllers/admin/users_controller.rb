class Admin::UsersController < Admin::AdminController
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      sign_in @user, bypass: true
      redirect_to :back, notice: "user updated"
    else
      @errors = @user.errors.full_messages.join('. ')
      redirect_to :back, alert: "#{@errors}"
    end
  end
end
