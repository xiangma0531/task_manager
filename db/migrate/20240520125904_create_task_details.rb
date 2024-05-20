class CreateTaskDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :task_details do |t|
      t.string :name, null: false
      t.text :notes
      t.date :due_date
      t.boolean :completed
      t.references :task_header, null: false, foreign_key: true

      t.timestamps
    end
  end
end
