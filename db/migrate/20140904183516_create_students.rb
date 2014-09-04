class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.datetime :last_called_at

      t.timestamps
    end
  end
end
