class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :product_id
      t.string :image
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end
end
