class AddListIdToCards < ActiveRecord::Migration[5.0]
  def change
    add_reference :cards, :list, foreign_key: true
  end
end
