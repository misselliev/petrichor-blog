# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page],per_page: 3)
  end

  def new
    @article = Article.new
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article was updated'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = 'Article was created!'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show; end

  def destroy
    @article.destroy
    flash[:danger] = 'Article was deleted'
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user
      flash[:danger]="You can only edit or delete your own articles"
      redirect_to root_path
    end
  end
end
