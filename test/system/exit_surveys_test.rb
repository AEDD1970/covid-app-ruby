require "application_system_test_case"

class ExitSurveysTest < ApplicationSystemTestCase
  setup do
    @exit_survey = exit_surveys(:one)
  end

  test "visiting the index" do
    visit exit_surveys_url
    assert_selector "h1", text: "Exit Surveys"
  end

  test "creating a Exit survey" do
    visit exit_surveys_url
    click_on "New Exit Survey"

    fill_in "Another", with: @exit_survey.Another
    fill_in "Cough", with: @exit_survey.Cough
    fill_in "Difficulty breathing", with: @exit_survey.Difficulty_breathing
    fill_in "Fatigue", with: @exit_survey.Fatigue
    fill_in "Muscle pain", with: @exit_survey.Muscle_pain
    fill_in "Nasal congestion", with: @exit_survey.Nasal_congestion
    fill_in "Shaking chills", with: @exit_survey.Shaking_chills
    fill_in "Sore throat", with: @exit_survey.Sore_throat
    fill_in "Respiratory", with: @exit_survey.respiratory
    click_on "Create Exit survey"

    assert_text "Exit survey was successfully created"
    click_on "Back"
  end

  test "updating a Exit survey" do
    visit exit_surveys_url
    click_on "Edit", match: :first

    fill_in "Another", with: @exit_survey.Another
    fill_in "Cough", with: @exit_survey.Cough
    fill_in "Difficulty breathing", with: @exit_survey.Difficulty_breathing
    fill_in "Fatigue", with: @exit_survey.Fatigue
    fill_in "Muscle pain", with: @exit_survey.Muscle_pain
    fill_in "Nasal congestion", with: @exit_survey.Nasal_congestion
    fill_in "Shaking chills", with: @exit_survey.Shaking_chills
    fill_in "Sore throat", with: @exit_survey.Sore_throat
    fill_in "Respiratory", with: @exit_survey.respiratory
    click_on "Update Exit survey"

    assert_text "Exit survey was successfully updated"
    click_on "Back"
  end

  test "destroying a Exit survey" do
    visit exit_surveys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exit survey was successfully destroyed"
  end
end
