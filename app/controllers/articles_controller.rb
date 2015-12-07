class ArticlesController < ApplicationController
	before_action :trainer_user, only: [:create, :edit, :uptate,:destroy]

	def show
		@article = Article.find(params[:id])
		@comment  = current_user.comments.build

		@discussion_comments = @article.discussion

	end

	def index
		@articles = Article.all
	end

	def create
		
		
        @article = current_user.articles.build(secure_article) 
        if @article.save
          flash[:success] = "Posted Article"
          redirect_to @article
        else
        	render 'new'
      end
  	  	
	end



	def new
		@article = Article.new
	end


	def edit
    @article = Article.find(params[:id])
    end

	def update
	    @article = Article.find(params[:id])
	    if @article.update_attributes(secure_article)
	       flash[:success] = "Article Updated"
	       redirect_to article_path
	    else
	      render action: "edit"
	    end
	end


	def destroy
		Article.find(params[:id]).destroy
    		flash[:success] = "Article deleted"
    		redirect_to articles_path
            
            
    end



    private
    def secure_article
    	params.require(:article).permit(:title,:content,:commentable)
    end
    
    def trainer_user
      redirect_to(root_url) unless current_user.trainer?
    end



end


