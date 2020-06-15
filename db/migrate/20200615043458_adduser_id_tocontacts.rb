class AdduserIdTocontacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :user_id ,:int
  end
end
