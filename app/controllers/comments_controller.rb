class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@comments = Comment.all
	end

	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def show
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(user_id: current_user.id, content: params[:content], post: @post)

		if @comment.save
			redirect_to post_path(@post.id)
			flash[:success] = "Votre commentaire a bien été ajouté 👍🏽"
		else
			redirect_to post_path(@post.id)
		end
	end

	def edit
		@comment = Comment.find(params[:id])
		redirect_to root_path, notice: "Vous ne pouvez pas éditer le commentaire d'une autre personne !" unless @comment.user == current_user
	end

	def update
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])

		if @comment.user == current_user
			if @comment.update(content: params[:content])
				redirect_to post_path(@post.id)
				flash[:success] = "Votre commentaire a bien été modifié 👍🏽"
			else
				flash[:alert] = "Vous n'avez pas rempli tous les champs, veuillez réessayez s'il vous plaît"
				render :edit
			end
		else
			redirect_to root_path, notice: "Vous ne pouvez pas éditer le commentaire d'une autre personne !"
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])

		if @comment.destroy
			redirect_to post_path(@post.id)
			flash[:success] = "Votre commentaire a bien été supprimé 👍🏽"
		else
			flash[:alert] = "Un problème est survenu"
			render :edit
		end
	end
end
