class AddProgressToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :progress, :float
  end
end
