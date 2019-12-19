class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.text :caption
      t.string :type
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
