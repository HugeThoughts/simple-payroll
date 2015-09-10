class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :emp_no, null: false,unique: true
      t.string :email, null: false,unique: true
      t.string :name, null: false
      t.string :PAN,unique: true
      t.date :DOJ
      t.boolean :isAdmin, null: false,default:false

      t.timestamps null: false
    end
  end
end
