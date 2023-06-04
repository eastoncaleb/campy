class TasksController < ApplicationController
	helper_method :tasks
	before_action :authenticate_user!
	before_action :task, except: %i[new create index]

	def index
		@task = Task.new
	end

	def show
	end

	def new
		@task = Task.new
	end

	def create
		@task = current_user.tasks.new(task_params)

		if @task.save
			redirect_to tasks_url, notice: "Task was successfully created!"	
		else
			redirect_to tasks_url, notice: @task.errors.full_messages
		end
	end

	def update
		respond_to do |format|
			if task.update(task_params)
				format.html { redirect_to tasks_url, notice: "Task was successfully updated" }
				format.turbo_stream do
					flash.now[:notice] = "Task was successfully updated!"
				end
			else
				format.html { render :edit, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		 task.destroy
		 redirect_to tasks_url, notice: "Task was successfully deleted"
	end

	def toggle
		@task = Task.find(params[:id])
		
		respond_to do |format|
			format.json do
				if @task.update(completed: params[:completed])
					render json: {
						status: "Success",
						message: "Task Successfully Updated" 
					}
				else
					render json: {
						status: "Failure",
						message: "Task Couldn't Be Updated!" 
					}
				end
			end
			format.turbo_stream do
				flash.now[:notice] = "Task was updated!"
				turbo_stream.replace "notice", partial: "shared/flash"
			end
		end
	end

	private

	def task_params
		params.require(:task).permit(:description)
	end

	def tasks
		@tasks ||= Task.all
	end

	def task
		@task ||= Task.find_by_id(params[:id])
	end
end
