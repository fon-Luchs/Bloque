class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :destroy, :update, :edit]
  def index
    @articles = Article.all
  end

  def new
    @article = current_user.articles.build
  end

  def edit
  end

  def create

    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, success: "Success created"
    else
      render :new, danger: "Article is not created"
    end
  end

  def show
  end

  def update
    if @article.update(article_params)
      redirect_to @article, info: "Success updated"
    else
      render 'edit', danger: "Article is not updated"
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_path, success: "Success deleted"
  end


  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :text, :all_categories)
    end

end
