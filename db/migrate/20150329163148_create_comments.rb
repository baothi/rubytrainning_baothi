class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :product_id
      t.text :content
      t.string :image
      t.boolean :status
      t.integer :user_id

      t.timestamps
    end
  end
end
