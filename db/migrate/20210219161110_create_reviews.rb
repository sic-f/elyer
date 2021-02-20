class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :headline
      t.text :content
      t.references :reviewer, null: false, foreign_key: { to_table: :users }
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
