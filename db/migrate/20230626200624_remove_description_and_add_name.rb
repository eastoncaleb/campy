class RemoveDescriptionAndAddName < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :description
    remove_column :tasks, :description
    add_column :tasks, :name, :string
  end
end
