class Admin::ProjectsController < Admin::AdminController
  def index
    @projects = Project.order(:position)
  end

  def new
    @project = Project.new
  end

  def create 
    @project = Project.new(params[:project])

    if @project.save
      redirect_to admin_projects_path, notice: 'project created'
    else
      @errors = @project.errors.full_messages.join('. ')
      redirect_to :back, alert: "#{@errors}"
    end
  end

  def update 
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to admin_projects_path, notice: 'project updated'
    else
      @errors = @project.errors.full_messages.join('. ')
      redirect_to :back, alert: "#{@errors}"
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy
    redirect_to :back, notice: 'project deleted'
  end

  def sort
    params[:projects].each_with_index do |id, index|
      Project.update_all({ position: index },{ id: id })
    end
    render nothing: true
  end
end
