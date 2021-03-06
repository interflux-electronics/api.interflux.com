class CreateQualities < ActiveRecord::Migration[5.1]
  def change
    create_table :qualities, id: :string, primary_key: 'slug' do |t|
      t.string :text
      t.string :icon
      t.text :gist

      t.timestamps
    end
  end
end
