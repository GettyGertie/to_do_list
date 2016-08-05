class AddTitleToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :title, :string
  end
end
