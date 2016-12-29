class PostsController < ApplicationController
	before_filter :authenticate_user!, :only => [:new, :create]

	def new
		@group = Group.find(params[:id])
		@post = Post.new
	end

	def create
		@group = Group.find(params[:id])
		@post = Post.new(post_params)

		if @post.save
			redirect_to group_path(@group), notice: "Post Create."
		else
			render :new
		end

	end


	private

	def post_params
		params.require(:post).permit(:content)
	end
end
