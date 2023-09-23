class AddEntityIdToDepartment < ActiveRecord::Migration[7.0]
  def change
    add_reference :departments, :entities, foreign_key: true
  end
end
