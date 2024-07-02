class ArticlesController < ApplicationController

  # tous les articles
  def index
    @articles = Article.all
  end

  # 1 article
  def show
    @article = Article.find(params[:id])
  end

  # GET ajouter un article
  def new
    @article = Article.new # on en a besoin pour instancier le form_with
  end

  # POST ajouter un article
  def create
    @article = Article.new(article_params)
    @article.save
    # pas besoin de view
    redirect_to article_path(@article)
  end

  # GET éditer un article
  def edit
    @article = Article.find(params[:id])
  end

  # PATCH éditer un article
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    # pas besoin de view
    redirect_to article_path(@article)
  end

  # supprimer un article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # pas besoin de view
    redirect_to article_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
