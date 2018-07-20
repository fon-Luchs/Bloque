class FiltersController < ApplicationController

  def create
    @filter = Filter.create(filter_params)

    ## if !!

  end

  private

  def filter_params
    @article  = Article.find(params[:article_id])
    @category = Category.find(params[:article_id])
    article_param  = [article_id: @article.id]
    category_param = [category_id: @category.id]
    params.require(:filter).permit(article_param, category_param)
  end
end
