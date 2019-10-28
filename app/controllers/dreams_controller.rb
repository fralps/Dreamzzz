class DreamsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@dreams = Dream.all.reverse
	end

	def show
		@dream = Dream.find(params[:id])
	end

	def new
		@dream = Dream.new
	end

	def create
		@dream = Dream.new(user_id: current_user.id, title: params[:title], date: params[:date], category: [:category], description: params[:description], emotion: params[:emotion])

		if @dream.save
			redirect_to dreams_path
			flash[:success] = "Votre rêves a bien été crée 💤"
		else
			render :new
		end
	end

	def edit
		@dream = Dream.find(params[:id])
		redirect_to root_path, notice: "Vous ne pouvez pas éditer le rêve d'une autre personne !" unless @dream.user == current_user
	end

	def update
		@dream = Dream.find(params[:id])

		if @dream.user == current_user
			if @dream.update(title: params[:title], date: params[:date], category: [:category], description: params[:description], emotion: params[:emotion])
				redirect_to dream_path(@dream)
				flash[:success] = "Votre rêve a bien été modifié"
			else
				flash[:alert] = "Vous n'avez pas rempli tous les champs, veuillez réessayez s'il vous plaît"
				render edit
			end
		else
			redirect_to root_path, notice: "Vous ne pouvez aps éditer le rêve d'une autre personne !"
		end
	end

	def destroy
		@dream = Dream.find(params[:id])

		if @dream.destroy
			redirect_to dreams_path(current_user)
			flash[:success] = "Votre rêve a bien été supprimé"
		else
			flash[:alert] = "Un problème est survenu"
			render :edit
		end
	end

end
