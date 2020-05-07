class CreateEntranceSurveys < ActiveRecord::Migration[5.2]
  def up
    create_table :entrance_surveys do |t|
      t.string :recorded_temperature
      t.string :new_temperature_recorded
      t.boolean :sore_throat
      t.boolean :nasal_congestion
      t.boolean :cough
      t.boolean :difficulty_breathing
      t.boolean :fatigue
      t.boolean :shaking_chills
      t.boolean :muscle_pain
      t.boolean :other_respiratory_symptom
      t.string :which_respiratory_symptom
      t.boolean :disposable_face_mask
      t.boolean :respirator
      t.boolean :latex_gloves
      t.boolean :nitrile_gloves
      t.boolean :rubber_gloves
      t.boolean :another_item
      t.string :which_other_element
      t.boolean :does_not_apply_protection
      t.string :does_not_apply_because
      t.boolean :hand_disinfection
      t.boolean :discard_used_items
      t.boolean :disinfection_element
      t.integer :employee_id
      t.datetime :creation_date_and_time

      t.timestamps
    end
  end

  def down
    drop_table :entrance_surveys
  end
end
