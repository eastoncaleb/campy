class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string      :name
      t.text        :description
      t.datetime    :start_date
      t.datetime    :end_date
      t.datetime    :due_date
      t.boolean     :completed
      t.timestamps
    end
  end
end
