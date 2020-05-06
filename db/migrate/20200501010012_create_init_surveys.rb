class CreateInitSurveys < ActiveRecord::Migration[5.2]
  def up
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
      t.string :disposable_covers_init
      t.string :respirador_init
      t.string :gloves_latex_init
      t.string :gloves_nitrilo_init
      t.string :gloves_caucho_init
      t.string :other_element_init
      t.string :not_other_element_init
      t.string :camp_a_init
      t.string :camp_b_init
      t.string :camp_c_init

      t.timestamps
    end
  end
  def down
    drop_table :init_surveys
  end
end
