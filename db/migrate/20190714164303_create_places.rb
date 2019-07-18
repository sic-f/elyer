class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :mobile
      t.string :landline
      t.string :email

      t.timestamps
    end
    add_index :places, :name
    add_index :places, :mobile
    add_index :places, :landline
    add_index :places, :email
  end
end
