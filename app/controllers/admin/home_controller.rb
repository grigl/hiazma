class Admin::HomeController < Admin::AdminController
  def index
    @user = User.first
    @mail = Setting.where('name = ?', 'feedback_email_to').first
  end
end
