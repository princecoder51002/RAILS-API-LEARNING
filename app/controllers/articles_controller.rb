class ArticlesController < ApplicationController 

    def index 
        articles = Article.all
        render json: serializer.new(articles)
    end

    def show 
       article = Article.find(params[:id])
       render json: serializer.new(article)
    end

    def serializer 
       ArticleSerializer
    end

end