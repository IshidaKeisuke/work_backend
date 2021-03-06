class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show destroy update]

  def index
    articles = Article.all.order(:id)
    render json: articles
  end

  def show
    render json: @article
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: article
    else
      render json: article.:errors
    end
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors
    end
  end

  def destroy
    if @article.destroy
      render json: @article
    else
      render json: @article.errors
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
