class ArticlesController < ApplicationController
  def index
    @articles = Article.desc.paginate page: params[:page], per_page: Settings.articles.page
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new(:article_id => @article.id)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = t ".created"
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:notice] = t ".updated"
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = t ".destroyed"
    redirect_to articles_url
  end

  private
  def article_params
    params.require(:article).permit(:name, :content)
  end
end
