class AddColumnToComment < ActiveRecord::Migration[5.1]
  def change
      add_column :comments, :content, :text
      add_column :comments, :restaurant_id, :integer
      add_column :comments, :user_id, :integer
  end
end
