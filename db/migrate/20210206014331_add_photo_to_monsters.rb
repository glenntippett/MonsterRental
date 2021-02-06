class AddPhotoToMonsters < ActiveRecord::Migration[6.0]
  def change
    add_column :monsters, :photo, :string
  end
end
