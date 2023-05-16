class TasksController < ApplicationController
	helper_method :tasks
	before_action :task, except: %i[new create index]

	def index
		@task = Task.new
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)

		if @task.save
			redirect_to tasks_url, notice: "Task was successfully created"
		else
			render :new, status: :unprocessable_entity
		end
	end

	def update
		respond_to do |format|
			if task.update(task_params)
				format.html { redirect_to tasks_url, notice: "Task was successfully updated" }
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
		@task.update(completed: params[:completed])
	
		render json: { message: "Success" }
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
