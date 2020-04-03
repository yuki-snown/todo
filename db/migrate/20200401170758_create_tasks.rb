class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :admin
      t.string :worker
      t.text :do
      t.boolean :status

      t.timestamps
    end
  end
end
