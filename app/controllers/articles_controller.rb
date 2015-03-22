class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_user, only: [:new, :create]
  def index
    @articles = Article.all.order("created_at DESC")
  end

  def show
  end

  def new
    @article = @user.articles.build
  end

  def edit
  end

  def create
    @article = @user.articles.build(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def find_user
    @user = current_user
  end

  def article_params
    params.require(:article).permit(:title, :content, :link, :image)
  end
end
