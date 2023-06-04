class ProjectsController < ApplicationController
  helper_method :projects
	before_action :authenticate_user!
	before_action :project, except: %i[new create index]

	def index
		@project = Project.new
	end

	def new
		@project = Project.new(project_params)
	end

	def create
		@project = current_user.projects.new(project_params)

		if @project.save
			flash.now[:notice] = "Project successfully created!"
		else
			flash.now[:notice] = "Project couldn't be created!"
		end
	end

  def update
		respond_to do |format|
			if project.update(project_params)
				format.html { redirect_to projects_url, notice: "Project was successfully updated" }
				format.turbo_stream do
					flash.now[:notice] = "Project was successfully updated!"
				end
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
		params.require(:project).permit(:name, :description, :start_date, :end_date, :due_date)
	end

	def projects
		@projects ||= Project.all
	end

	def project
		@project ||= Project.find_by_id(params[:id])
	end
end
