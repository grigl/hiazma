class Admin::JobsController < Admin::AdminController
  def index
    @jobs = Job.order(:position)
  end

  def new
    @job = Job.new
  end

  def create 
    @job = Job.new(params[:job])

    if @job.save
      redirect_to admin_jobs_path, notice: 'job created'
    else
      @errors = @job.errors.full_messages.join('. ')
      redirect_to :back, alert: "#{@errors}"
    end
  end

  def update 
    @job = Job.find(params[:id])

    if @job.update_attributes(params[:job])
      redirect_to admin_jobs_path, notice: 'job updated'
    else
      @errors = @job.errors.full_messages.join('. ')
      redirect_to :back, alert: "#{@errors}"
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

  def sort
    params[:jobs].each_with_index do |id, index|
      Job.update_all({ position: index },{ id: id })
    end
    render nothing: true
  end
end
