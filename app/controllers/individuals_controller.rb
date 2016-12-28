class IndividualsController < ApplicationController

	before_action :set_group

	def create
		
		@individual = @group.individuals.create(individual_params)
		redirect_to @group
	end

	def destroy
		@individual = @group.individuals.find(params[:id])
		if @individual.destroy
			flash[:success] = "Individual was deleted"
		else
			flash[:error] = "Individual was not deleted"
		end
	
	redirect_to @group
	end

	private

	def set_group
		@group = Group.find(params[:group_id])
	end

	def individual_params
		params[:individual].permit(:name, :check)
	end
end
