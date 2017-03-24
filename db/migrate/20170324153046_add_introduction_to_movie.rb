class AddIntroductionToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :introduction, :text
  end
end
