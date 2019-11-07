class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@posts = Post.all.reverse
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(user_id: current_user.id, title: params[:title], content: params[:content], image_url: params[:image_url])

		if @post.save
			redirect_to posts_path
			flash[:success] = "Votre article a bien été publié 👍🏽"
		else
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
		redirect_to root_path, notice: "Vous ne pouvez pas éditer l'article d'une autre personne !" unless @post.user == current_user
	end

	def update
		@post = Post.find(params[:id])

		if @post.user == current_user
			if @post.update(title: params[:title], content: params[:content], image_url: params[:image_url])
				redirect_to posts_path
				flash[:success] = "Votre article a bien été modifié 👍🏽"
			else
				flash[:alert] = "Vous n'avez pas rempli tous les champs, veuillez réessayez s'il vous plaît"
				render edit
			end
		else
			redirect_to root_path, notice: "Vous ne pouvez pas éditer l'article d'une autre personne !"
		end
	end

	def destroy
		@post = Post.find(params[:id])

		if @post.destroy
			redirect_to posts_path(current_user)
			flash[:success] = "Votre article a bien été supprimé 👍🏽"
		else
			flash[:alert] = "Un problème est survenu"
			render :edit
		end
	end

end
