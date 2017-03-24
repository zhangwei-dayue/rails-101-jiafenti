class AddFilmnameToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :filmname, :string
  end
end
