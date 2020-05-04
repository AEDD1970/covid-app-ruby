class CreateInterpretations < ActiveRecord::Migration[5.2]
  def up
    create_table :interpretations do |t|
      t.string :description

      t.timestamps
    end
  end
  def down
    drop_table :interpretations
  end
end
