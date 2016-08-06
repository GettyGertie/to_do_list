class AddUserIdToRequesters < ActiveRecord::Migration[5.0]
  def change
    add_reference :requesters, :user, foreign_key: true
  end
end
