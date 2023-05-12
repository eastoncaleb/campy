class TasksController < ApplicationController
	helper_method :task, :tasks

	def index; end

	def create
		@task = Task.new(task_params)

		if @task.save
			redirect_to tasks_url, notice: "Task was successfully created"
		else
			render :new, status: :unprocessable_entity
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
		@task ||= Task.new
	end
end
