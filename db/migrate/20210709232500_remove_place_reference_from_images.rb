class RemovePlaceReferenceFromImages < ActiveRecord::Migration[6.1]
  def change
    remove_reference :images, :place, foreign_key: true, index: true
  end
end
