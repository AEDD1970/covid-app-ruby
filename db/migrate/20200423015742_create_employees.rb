class CreateEmployees < ActiveRecord::Migration[5.2]
  def up
    create_table :employees do |t|
      t.string :responsible
      t.string :responsible_position
      t.integer :document_number
      t.string :name
      t.string :organizational_unit
      t.string :position
      t.string :contractor_company
      t.string :gender
      t.string :eps
      t.integer :age
      t.string :blood_type
      t.integer :phone, limit: 15
      t.integer :emergency_number, limit: 15
      t.string :weight
      t.string :size
      t.float :imc
      t.string :interpretation
      t.datetime :date_and_time
      t.integer :company_id

      t.timestamps
    end
  end

  def down
    drop_table :employees
  end
end
