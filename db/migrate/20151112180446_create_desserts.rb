class CreateDesserts < ActiveRecord::Migration
  def change
    create_table :desserts do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.decimal :retail_price, :precision => 10, :scale => 2
      t.decimal :wholesale_price, :precision => 10, :scale => 2
      t.references :desserts_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
