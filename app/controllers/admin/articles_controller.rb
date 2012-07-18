class Admin::ArticlesController < Admin::AdminController
  def index
    @articles = Article.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create 
    @article = Article.new(params[:article])

    if @article.save
      redirect_to admin_articles_path, notice: 'article created'
    else
      @errors = @article.errors.full_messages.join('. ')
      redirect_to :back, alert: "#{@errors}"
    end
  end

  def update 
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to admin_articles_path, notice: 'article updated'
    else
      @errors = @article.errors.full_messages.join('. ')
      redirect_to :back, alert: "#{@errors}"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    redirect_to :back, notice: 'article deleted'
  end
end
