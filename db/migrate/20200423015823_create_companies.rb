class CreateCompanies < ActiveRecord::Migration[5.2]
  def up
    create_table :companies do |t|
      t.string :name

      t.timestamps
    end
  end
end
