class CreateInformation < ActiveRecord::Migration[7.0]
  def change
    create_table :information do |t|
      t.references :user, index: true
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
