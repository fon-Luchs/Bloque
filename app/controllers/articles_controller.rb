class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @articles = Article.all
  end

  def new
    @article = current_user.articles.build
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.user_name = current_user.user_name
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
