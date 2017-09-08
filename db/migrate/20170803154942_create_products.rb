# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.string :product_type
      t.boolean :public, default: false
      t.string :pitch
      t.text :corpus

      # TODO
      # t.text :documents, array: true, default: []

      t.timestamps
    end
  end
end
