class Admin::AboutsController < Admin::AdminController
  def show
    @abouts = About.first(6)
  end

  def update
    @about = About.find(params[:about][:id])

    if @about.update_attributes(params[:about].except(:id))
      redirect_to :back, notice: "about updated"
    else
      @errors = @about.errors.full_messages.join(' ')
      redirect_to :back, alert: "#{@errors}"
    end
  end
end
