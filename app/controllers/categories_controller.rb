class CategoriesController < ApplicationController

  def create
    @article  = Article.find(params[:article_id])
    @category = @article.categories.create(category_params)
  end

  private

    def category_params
      params.require(:category).permit(:category)
    end
end
