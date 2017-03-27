class ChangeStringToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :movie_relationships, :movie_id, :integer
  end
end
