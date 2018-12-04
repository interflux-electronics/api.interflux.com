class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :slug
      t.string :name
      t.string :pitch
      t.boolean :public, default: false

      t.uuid :main_group_id
      t.uuid :sub_group_id

      t.timestamps
    end

    add_index :products, :public
    add_index :products, :slug, unique: true
    add_index :products, :name, unique: true
    add_index :products, :main_group_id
    add_index :products, :sub_group_id
  end
end
