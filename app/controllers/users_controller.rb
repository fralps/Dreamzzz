class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])		
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to "/"
		flash[:success] = "Votre profil a été supprimé avec succès"
	end
	
end
