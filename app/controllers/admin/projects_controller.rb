class Admin::ProjectsController < Admin::AdminController
  def index
    @projects = Project.order('created_at DESC')
  end

  def new
    @project = Project.new
  end

  def create 
    @project = Project.new(params[:project])

    if @project.save
      redirect_to :back, notice: 'project created'
    else
      redirect_to :back, alert: 'errors'
    end
  end

  def update 
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to :back, notice: 'project updated'
    else
      redirect_to :back, alert: 'errors'
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
end
