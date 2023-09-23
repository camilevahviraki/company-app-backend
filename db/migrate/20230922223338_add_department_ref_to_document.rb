class AddDepartmentRefToDocument < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents, :department, foreign_key: true
    add_reference :documents, :user, foreign_key: true
  end
end
