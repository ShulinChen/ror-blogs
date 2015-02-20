class ArticlesController < ApplicationController
	
	#http://0.0.0.0:3000/articles/
	def index
		@articles = Article.all
	end



	def show
		#rails will pass the instance variable article to the View
		@articles = Article.find(params[:id])
	end


	def new
		@article = Article.new
	end


	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)		
		#@article = Article.new(params.require(:article).permit(:title,:text))
		
		# #to save the model in db
		# @article.save
		# #the following line redirect it to the show action
		# redirect_to @article

		if @article.save
			#@article.save
			redirect_to @article
		else
			#render means the page is still under the same request..so all the info will be kept at current moment.
			render 'new'
		end
	end




	#the following line is factored out from above in order to be reused.
	private
		def article_params
			params.require(:article).permit(:title,:text)
		end

end
