class AddCountryToEntity < ActiveRecord::Migration[7.0]
  def change
    add_column :entities, :country, :string
  end
end
