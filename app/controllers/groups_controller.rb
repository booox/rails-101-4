class GroupsController < ApplicationController
	before_action :authenticate_user!, only: [:new]

	def index
		@groups = Group.all
	end
	
	def show
		@group = Group.find(params[:id])
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.create(group_params)

		if @group.save
			redirect_to groups_path, notice: "Gropu Create Success"	
		else
			render :new
		end
	end

	# edit
	def edit
		@group = Group.find(params[:id])
	end

	def update
		@group = Group.find(params[:id])

		if @group.update(group_params)
			redirect_to groups_path, notice: "Update Success"
		else
			render :edit
		end
	end

	# delete
	def destroy
		@group = Group.find(params[:id])
		@group.destroy

		redirect_to groups_path, alert: "Group Deleted."
	end

	private

	def group_params
		params.require(:group).permit(:title, :description)	
	end
end
