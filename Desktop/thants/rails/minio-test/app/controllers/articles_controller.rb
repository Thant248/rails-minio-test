class ArticlesController < ApplicationController
    # 一覧
    def index
      @articles = Article.all
    end
    
    # 詳細
    def show
      @article = Article.find(params[:id])
    end
    
    # 新規投稿画面
    def new
      @article = Article.new
    end
    
    # 新規投稿
    def create
      @article = Article.new(article_params)
    
      if @article.save
        redirect_to @article
      else
        render :new
      end
    end
    
    private
      def article_params
        params.require(:article).permit(:title, :body, :image)
      end
    end
    