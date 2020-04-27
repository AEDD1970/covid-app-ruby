class CreateSurveyHistories < ActiveRecord::Migration[5.2]
  def up
    create_table :survey_histories do |t|
      t.datetime :entry_time
      t.datetime :departure_time
      t.string :temperature
      t.boolean :mask
      t.boolean :new_mask
      t.boolean :symptom
      t.integer :employee_id

      t.timestamps
    end
  end
end
