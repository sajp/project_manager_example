class CreateTasks < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
      t.references :project
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
