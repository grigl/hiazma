class Admin::JobsController < Admin::AdminController
  def index
    @jobs = Job.order('created_at DESC')
  end

  def new
    @job = Job.new
  end

  def create 
    @job = Job.new(params[:job])

    if @job.save
      redirect_to :back, notice: 'job created'
    else
      redirect_to :back, alert: 'errors'
    end
  end

  def update 
    @job = Job.find(params[:id])

    if @job.update_attributes(params[:job])
      redirect_to :back, notice: 'job updated'
    else
      redirect_to :back, alert: 'errors'
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy
    redirect_to :back, notice: 'job deleted'
  end
end
