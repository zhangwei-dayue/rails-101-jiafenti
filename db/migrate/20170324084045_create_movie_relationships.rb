class CreateMovieRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_relationships do |t|
      t.string :movie_id
      t.string :integer
      t.integer :user_id

      t.timestamps
    end
  end
end
