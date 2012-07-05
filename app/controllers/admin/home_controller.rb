class Admin::HomeController < Admin::AdminController
  def index
    @user = User.first
  end
end
