class CreateExitSurveys < ActiveRecord::Migration[5.2]
  def up
    create_table :exit_surveys do |t|
      t.string :Sore_throat
      t.string :Nasal_congestion
      t.string :Cough
      t.string :Difficulty_breathing
      t.string :Fatigue
      t.string :Shaking_chills
      t.string :Muscle_pain
      t.string :Another
      t.string :respiratory
      t.string :temperature
      t.string :new_temperature
      t.integer :employee_id
      t.string :disposable_covers
      t.string :respirador
      t.string :gloves_latex
      t.string :gloves_nitrilo
      t.string :gloves_caucho
      t.string :other_element
      t.string :not_other_element

      t.timestamps
    end
  end

  def down
    drop_table :exit_surveys
  end

  end

