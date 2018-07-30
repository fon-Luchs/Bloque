class FiltersController < ApplicationController

  def new
    @filter = Filter.new
  end

  def create
    @filter = Filter.create(filter_params)
  end

  private

  def filter_params
    @article  = Article.find(params[:article_id])
    @category = Category.find(params[:category_id])
    article_param  = [article_id: @article.id]
    category_param = [category_id: @category.id]
    params.require(:filter).permit(article_param, category_param)
  end
end
