require "application_system_test_case"

class InitSurveysTest < ApplicationSystemTestCase
  setup do
    @init_survey = init_surveys(:one)
  end

  test "visiting the index" do
    visit init_surveys_url
    assert_selector "h1", text: "Init Surveys"
  end

  test "creating a Init survey" do
    visit init_surveys_url
    click_on "New Init Survey"

    fill_in "Another init", with: @init_survey.another_init
    fill_in "Cough init", with: @init_survey.cough_init
    fill_in "Difficulty breathing init", with: @init_survey.difficulty_breathing_init
    fill_in "Fatigue init", with: @init_survey.fatigue_init
    fill_in "Muscle pain init", with: @init_survey.muscle_pain_init
    fill_in "Nasal congestion init", with: @init_survey.nasal_congestion_init
    fill_in "New temperature init", with: @init_survey.new_temperature_init
    fill_in "Respiratory init", with: @init_survey.respiratory_init
    fill_in "Shaking chills init", with: @init_survey.shaking_chills_init
    fill_in "Sore throat init", with: @init_survey.sore_throat_init
    fill_in "Temperature init", with: @init_survey.temperature_init
    click_on "Create Init survey"

    assert_text "Init survey was successfully created"
    click_on "Back"
  end

  test "updating a Init survey" do
    visit init_surveys_url
    click_on "Edit", match: :first

    fill_in "Another init", with: @init_survey.another_init
    fill_in "Cough init", with: @init_survey.cough_init
    fill_in "Difficulty breathing init", with: @init_survey.difficulty_breathing_init
    fill_in "Fatigue init", with: @init_survey.fatigue_init
    fill_in "Muscle pain init", with: @init_survey.muscle_pain_init
    fill_in "Nasal congestion init", with: @init_survey.nasal_congestion_init
    fill_in "New temperature init", with: @init_survey.new_temperature_init
    fill_in "Respiratory init", with: @init_survey.respiratory_init
    fill_in "Shaking chills init", with: @init_survey.shaking_chills_init
    fill_in "Sore throat init", with: @init_survey.sore_throat_init
    fill_in "Temperature init", with: @init_survey.temperature_init
    click_on "Update Init survey"

    assert_text "Init survey was successfully updated"
    click_on "Back"
  end

  test "destroying a Init survey" do
    visit init_surveys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Init survey was successfully destroyed"
  end
end
