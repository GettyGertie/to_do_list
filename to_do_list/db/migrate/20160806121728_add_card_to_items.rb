class AddCardToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :card, foreign_key: true
  end
end
