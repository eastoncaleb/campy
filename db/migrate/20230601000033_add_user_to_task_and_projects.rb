class AddUserToTaskAndProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :creator, foreign_key: { to_table: :users }, null: false
    add_reference :projects, :assignee, foreign_key: { to_table: :users }, null: true
    add_reference :tasks, :creator, foreign_key: { to_table: :users }, null: false
    add_reference :tasks, :assignee, foreign_key: { to_table: :users }, null: true
  end
end
