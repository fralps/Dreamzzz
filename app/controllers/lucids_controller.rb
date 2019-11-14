class LucidsController < ApplicationController
	before_action :authenticate_user!

	def index
		@lucids = Lucid.all.reverse
	end

	def show
		@lucid = Lucid.find(params[:id])
	end

	def new
		@lucid = Lucid.new
	end

	def create
		@lucid = Lucid.new(user_id: current_user.id, title: params[:title], date: params[:date], description: params[:description], emotion: params[:emotion], is_online: params[:is_online])

		if @lucid.save
			redirect_to dreams_path
			flash[:success] = "Votre rêve lucide a bien été crée 💤"
		else
			render :new
		end
	end

	def edit
		@lucid = Lucid.find(params[:id])
		redirect_to root_path, notice: "Vous ne pouvez pas éditer le rêve lucide d'une autre personne !" unless @lucid.user == current_user
	end

	def update
		@lucid = Lucid.find(params[:id])

		if @lucid.user == current_user
			if @lucid.update(title: params[:title], date: params[:date], description: params[:description], emotion: params[:emotion], is_online: params[:is_online])
				redirect_to lucid_path(@lucid.id)
				flash[:success] = "Votre rêve lucide a bien été modifié 👍🏽"
			else
				flash[:alert] = "Vous n'avez pas rempli tous les champs, veuillez réessayez s'il vous plaît"
				render edit
			end
		else
			redirect_to root_path, notice: "Vous ne pouvez pas éditer le rêve lucide d'une autre personne !"
		end
	end

	def destroy
		@lucid = Lucid.find(params[:id])

		if @lucid.destroy
			redirect_to dreams_path(current_user)
			flash[:success] = "Votre rêve lucide a bien été supprimé 👍🏽"
		else
			flash[:alert] = "Un problème est survenu"
			render :edit
		end
	end
end
