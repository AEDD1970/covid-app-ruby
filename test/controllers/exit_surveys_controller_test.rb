require 'test_helper'

class ExitSurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exit_survey = exit_surveys(:one)
  end

  test "should get index" do
    get exit_surveys_url
    assert_response :success
  end

  test "should get new" do
    get new_exit_survey_url
    assert_response :success
  end

  test "should create exit_survey" do
    assert_difference('ExitSurvey.count') do
      post exit_surveys_url, params: { exit_survey: { Another: @exit_survey.Another, Cough: @exit_survey.Cough, Difficulty_breathing: @exit_survey.Difficulty_breathing, Fatigue: @exit_survey.Fatigue, Muscle_pain: @exit_survey.Muscle_pain, Nasal_congestion: @exit_survey.Nasal_congestion, Shaking_chills: @exit_survey.Shaking_chills, Sore_throat: @exit_survey.Sore_throat, respiratory: @exit_survey.respiratory } }
    end

    assert_redirected_to exit_survey_url(ExitSurvey.last)
  end

  test "should show exit_survey" do
    get exit_survey_url(@exit_survey)
    assert_response :success
  end

  test "should get edit" do
    get edit_exit_survey_url(@exit_survey)
    assert_response :success
  end

  test "should update exit_survey" do
    patch exit_survey_url(@exit_survey), params: { exit_survey: { Another: @exit_survey.Another, Cough: @exit_survey.Cough, Difficulty_breathing: @exit_survey.Difficulty_breathing, Fatigue: @exit_survey.Fatigue, Muscle_pain: @exit_survey.Muscle_pain, Nasal_congestion: @exit_survey.Nasal_congestion, Shaking_chills: @exit_survey.Shaking_chills, Sore_throat: @exit_survey.Sore_throat, respiratory: @exit_survey.respiratory } }
    assert_redirected_to exit_survey_url(@exit_survey)
  end

  test "should destroy exit_survey" do
    assert_difference('ExitSurvey.count', -1) do
      delete exit_survey_url(@exit_survey)
    end

    assert_redirected_to exit_surveys_url
  end
end
