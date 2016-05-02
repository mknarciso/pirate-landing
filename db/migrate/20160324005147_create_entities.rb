class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :email
      t.string :name
      t.timestamps
    end
  end
end
