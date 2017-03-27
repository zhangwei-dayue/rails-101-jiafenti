class RemoveColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :movie_relationships, :integer, :string
  end
end
