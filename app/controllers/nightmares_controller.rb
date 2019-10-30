class NightmaresController < ApplicationController
	before_action :authenticate_user!

	def index
		@nightmares = Nightmare.all.reverse
	end

	def show
		@nightmare = Nightmare.find(params[:id])
	end

	def new
		@nightmare = Nightmare.new
	end

	def create
		@nightmare = Nightmare.new(user_id: current_user.id, title: params[:title], date: params[:date], description: params[:description], emotion: params[:emotion])

		if @nightmare.save
			redirect_to dreams_path
			flash[:success] = "Votre cauchemar a bien été crée 💤"
		else
			render :new
		end
	end

	def edit
		@nightmare = Nightmare.find(params[:id])
		redirect_to root_path, notice: "Vous ne pouvez pas éditer le cauchemar d'une autre personne !" unless @nightmare.user == current_user
	end

	def update
		@nightmare = Nightmare.find(params[:id])

		if @nightmare.user == current_user
			if @nightmare.update(title: params[:title], date: params[:date], description: params[:description], emotion: params[:emotion])
				redirect_to nightmare_path(@nightmare)
				flash[:success] = "Votre cauchemar a bien été modifié"
			else
				flash[:alert] = "Vous n'avez pas rempli tous les champs, veuillez réessayez s'il vous plaît"
				render edit
			end
		else
			redirect_to root_path, notice: "Vous ne pouvez pas éditer le cauchemar d'une autre personne !"
		end
	end

	def destroy
		@nightmare = Nightmare.find(params[:id])

		if @nightmare.destroy
			redirect_to dreams_path(current_user)
			flash[:success] = "Votre cauchemar a bien été supprimé"
		else
			flash[:alert] = "Un problème est survenu"
			render :edit
		end
	end
end

