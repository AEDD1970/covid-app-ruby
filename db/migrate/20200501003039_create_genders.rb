class CreateGenders < ActiveRecord::Migration[5.2]
  def up
    create_table :genders do |t|
      t.string :description

      t.timestamps
    end
  end
  def down
    drop_table :genders
  end
end
