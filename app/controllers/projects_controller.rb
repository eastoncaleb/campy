class ProjectsController < ApplicationController
  helper_method :projects
	before_action :project, except: %i[new create index]

	def index
		@project = Project.new
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to projects_url, notice: "Project was successfully created"
		else
			render :new, status: :unprocessable_entity
		end
	end

	def update
		respond_to do |format|
			if project.update(project_params)
				format.html { redirect_to projects_url, notice: "Project was successfully updated" }
			else
				format.html { render :edit, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		 project.destroy
		 redirect_to projects_url, notice: "Project was successfully deleted"
	end

	def toggle
		@project = Project.find(params[:id])
		if @project.update(completed: params[:completed])
			render json: {
				status: "Success",
				message: "Project Successfully Updated" 
			}
		else
			render json: {
				status: "Failure",
				message: "Project Couldn't Be Updated!" 
			}
		end
	end

	private

	def project_params
		params.require(:project).permit(:description)
	end

	def projects
		@projects ||= Project.all
	end

	def project
		@project ||= Project.find_by_id(params[:id])
	end
end
