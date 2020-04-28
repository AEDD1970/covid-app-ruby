class CreateEmployees < ActiveRecord::Migration[5.2]
  def up
    create_table :employees do |t|
      t.string :name
      t.string :last_name
      t.string :document_type
      t.integer :document_number
      t.string :blood_type
      t.string :gender
      t.string :position
      t.integer :company_id
      t.string :campus
      t.string :email
      t.string :admin

      t.timestamps
    end
  end

  def down
    drop_table :employees
  end
end
