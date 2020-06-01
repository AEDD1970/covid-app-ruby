class CreateEmployees < ActiveRecord::Migration[5.2]
  def up
    create_table :employees do |t|
      t.string :responsible
      t.string :responsible_position
      t.integer :document_number, :limit => 8
      t.string :name
      t.string :organizational_unit
      t.string :position
      t.string :contractor_company
      t.string :gender_id
      t.string :eps
      t.integer :age
      t.string :blood_type
      t.integer :phone, :limit => 8
      t.integer :emergency_number, :limit => 8
      t.integer :weight
      t.float :size
      t.float :imc
      t.string :interpretation
      t.string :date_and_time
      t.integer :company_id

      t.timestamps
    end
  end

  def down
    drop_table :employees
  end
end
