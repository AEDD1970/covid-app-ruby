class CreateInitSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :init_surveys do |t|
      t.string :sore_throat_init
      t.string :nasal_congestion_init
      t.string :cough_init
      t.string :difficulty_breathing_init
      t.string :fatigue_init
      t.string :shaking_chills_init
      t.string :muscle_pain_init
      t.string :another_init
      t.string :respiratory_init
      t.string :temperature_init
      t.string :new_temperature_init
      t.integer :employee_id

      t.timestamps
    end
  end
end
