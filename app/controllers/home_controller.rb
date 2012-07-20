class HomeController < ApplicationController
  def index
    @abouts = About.first(6)
    @articles = Article.order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
    @projects = Project.order(:position)
    @jobs = Job.order(:position)
    @contacts = Contact.first
  end
end
