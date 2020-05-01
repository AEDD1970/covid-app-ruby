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

      t.timestamps
    end
  end

  def down
    drop_table :exit_surveys
  end

  end

