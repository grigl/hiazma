class HomeController < ApplicationController
  def index
    @abouts = About.with_translations(I18n.locale).first(6)
    @articles = Article.with_translations(I18n.locale).order('articles.created_at DESC').paginate(:page => params[:page], :per_page => 3)
    @projects = Project.with_translations(I18n.locale).order(:position)
    @jobs = Job.with_translations(I18n.locale).order(:position)
    @contacts = Contact.first
  end
end
