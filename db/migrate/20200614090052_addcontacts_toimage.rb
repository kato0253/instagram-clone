class AddcontactsToimage < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :image, :text
  end
end
