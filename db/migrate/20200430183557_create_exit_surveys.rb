class CreateExitSurveys < ActiveRecord::Migration[5.2]
  def up
    create_table :exit_surveys do |t|
      t.string :recorded_temperature_exit
      t.string :new_temperature_recorded_exit
      t.boolean :sore_throat_exit
      t.boolean :nasal_congestion_exit
      t.boolean :cough_exit
      t.boolean :difficulty_breathing_exit
      t.boolean :fatigue_exit
      t.boolean :shaking_chills_exit
      t.boolean :muscle_pain_exit
      t.boolean :other_respiratory_symptom_exit
      t.string :which_respiratory_symptom_exit
      t.boolean :disposable_face_mask_exit
      t.boolean :respirator_exit
      t.boolean :latex_gloves_exit
      t.boolean :nitrile_gloves_exit
      t.boolean :rubber_gloves_exit
      t.boolean :another_item_exit
      t.string :which_other_element_exit
      t.boolean :does_not_apply_protection_exit
      t.string :does_not_apply_because_exit
      t.boolean :hand_disinfection_exit
      t.boolean :discard_used_items_exit
      t.boolean :disinfection_element_exit
      t.integer :employee_id
      t.date :date
      t.string :hour

      t.timestamps
    end
  end

  def down
    drop_table :exit_surveys
  end

  end

