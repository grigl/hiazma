class Admin::FeedbackEmailTosController < Admin::AdminController
  def update
    @mail = Setting.find(params[:setting][:id])

    if @mail.update_attributes(params[:setting].except(:id))
      redirect_to :back, notice: "mail updated"
    else
      redirect_to :back, alert: "errors"
    end
  end
end
