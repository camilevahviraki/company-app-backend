class CreateDocument < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string 'name'
      t.string 'data_url'
      t.string 'type'

      t.timestamps
    end
  end
end
