class AddProjectIdToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :project, index: true, null: true
  end
end
