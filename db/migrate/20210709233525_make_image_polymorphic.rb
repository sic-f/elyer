class MakeImagePolymorphic < ActiveRecord::Migration[6.1]
  def change
    change_table :images do |t|
      t.references :imageable, polymorphic: true
    end
  end
end
