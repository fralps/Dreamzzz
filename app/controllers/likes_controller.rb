class LikesController < ApplicationController
	before_action :authenticate_user!

	def new	
		@post = Post.find(params[:post_id]) 
    @like = Like.new
  end

  def create
  	@post = Post.find(params[:post_id])
  	@like = Like.new(user: current_user, post: @post)

		if @like.save
    	redirect_to post_path(@post.id)
			flash[:success] = "Vous avez liker l'article : #{@post.title} 👍🏽"
		else
			 puts @like.errors.full_messages
    puts "something goes wrong"
			flash[:alert] = "Une erreur est survenue"
			#redirect_to request.referrer
    end	
  end

  def destroy
  	@post = Post.find(params[:post_id])
  	@like = Like.find(params[:id])
 		
 		if @like.destroy
			redirect_to post_path(@post.id)
			flash[:success] = "Vous avez bien déliker l'article : #{@post.title}"
		else
			flash[:alert] = "Un problème est survenu"
		end
  end
end
