class ArticlesController < ApplicationController
  def show
    @article  = Article.find(params[:id])
  end

  def create
    user    = User.find_by(id: session[:user_id])
    article = Wikipedia.find(params[:title])
    user.articles.create(title: article.title, url: article.fullurl, body: article.text, privacy: 1)
    redirect_to dashboard_path
  end

  def update
    @article = Article.find(params[:id])
    user    = User.find_by(id: session[:user_id])
    @article.comments.create(user_id: user.id, body: params[:article][:body])
    render :show
  end

  def destroy
    article = Article.find(params[:id])
    if current_user.articles.include?(article)
      article.destroy
      redirect_to dashboard_path
    else
      flash[:error] = "That wasn't your article"
    redirect_to dashboard_path
    end
  end

end
