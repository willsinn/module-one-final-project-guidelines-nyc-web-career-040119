class CreateSwimmers < ActiveRecord::Migration[5.0]
  def change
    create_table :swimmers do |t|
      t.string :name
      t.integer :age
      t.boolean :gender

      t.timestamps
  end
end
