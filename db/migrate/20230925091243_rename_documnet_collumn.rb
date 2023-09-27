class RenameDocumnetCollumn < ActiveRecord::Migration[7.0]
  def change
    change_table :documents do |t|
      t.rename :type, :department_type
    end
  end
end
