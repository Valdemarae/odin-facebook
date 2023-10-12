class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :creator, index: true, foreign_key: { to_table: :users }
      t.text :content
      t.references :post, index: true
      t.timestamps
    end
  end
end
