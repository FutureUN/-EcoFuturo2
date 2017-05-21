class ArticlesController < ApplicationController

	#GET /articles
	def index
		#Se obtienen todos los registros(all)
		@articles = Article.all
	end
	# /articles/:id
	def show
		#Encuentra un registro por su id(find)
		@article = Article.find(params[:id])
		#where devuelve uno o varios valores casi independientes
		#Article.where("id = ? OR title = ?", params[:id], params[:title])
		#Encuentra todos menos estos
		#Article.where.not("id = ? OR title = ?", params[:id], params[:title])
	end
	#GET "/articles/new"
	def new
		#Crea un registro
		@article = Article.new
	end
	#POST /arricles
	def create
		#INSERT INTO
		@article = Article.new(article_params)
		
		if @article.save
			redirect_to @article
		else
			render :new
		end
	end

	def edit
		@article = Article.find(params[:id])
	end
	#DELETE /articles/:id
	def destroy
		#DELETE FROM articles
		@article = Article.find(params[:id])
		@article.destroy #Destroy elimina el objeto de la base de datos
		redirect_to articles_path
	end

	#PUT /articles/:id
	def update
		#UPDATE
		#@article.update_attributes({title: 'Nuevo titulo'})
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	private

	def article_params
		params.require(:article).permit(:title,:body)
		
	end

end