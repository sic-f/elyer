class AddSocialMediaAndWebsiteToPlaces < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :website, :string
    add_column :places, :facebook, :string
    add_column :places, :instagram, :string
  end
end
