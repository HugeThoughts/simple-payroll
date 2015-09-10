class CreatePayslips < ActiveRecord::Migration
  def change
    create_table :payslips do |t|
      t.integer :emp_no, null: false,unique: true
      t.integer :month, null: false
      t.integer :year, null: false
      t.float :basic
      t.float :conveyance
      t.float :medical
      t.float :hra
      t.float :bonus
      t.float :lta
      t.float :fuel
      t.float :mobile
      t.float :loan
      t.float :advance
      t.float :tds

      t.timestamps null: false
    end
  end
end
