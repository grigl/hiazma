class Admin::AboutsController < Admin::AdminController
  def show
    @abouts = About.first(6)
  end

  def update
    @about = About.find(params[:about][:id])
    @about.title = params[:about][:title]
    @about.description = params[:about][:description]

    if @about.save
      redirect_to :back, notice: "about updated"
    else
      @errors = @about.errors.full_messages.join(' ')
      redirect_to :back, alert: "#{@errors}"
    end
  end
end
