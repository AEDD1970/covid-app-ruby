require 'test_helper'

class InitSurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @init_survey = init_surveys(:one)
  end

  test "should get index" do
    get init_surveys_url
    assert_response :success
  end

  test "should get new" do
    get new_init_survey_url
    assert_response :success
  end

  test "should create init_survey" do
    assert_difference('InitSurvey.count') do
      post init_surveys_url, params: { init_survey: { another_init: @init_survey.another_init, cough_init: @init_survey.cough_init, difficulty_breathing_init: @init_survey.difficulty_breathing_init, fatigue_init: @init_survey.fatigue_init, muscle_pain_init: @init_survey.muscle_pain_init, nasal_congestion_init: @init_survey.nasal_congestion_init, new_temperature_init: @init_survey.new_temperature_init, respiratory_init: @init_survey.respiratory_init, shaking_chills_init: @init_survey.shaking_chills_init, sore_throat_init: @init_survey.sore_throat_init, temperature_init: @init_survey.temperature_init } }
    end

    assert_redirected_to init_survey_url(InitSurvey.last)
  end

  test "should show init_survey" do
    get init_survey_url(@init_survey)
    assert_response :success
  end

  test "should get edit" do
    get edit_init_survey_url(@init_survey)
    assert_response :success
  end

  test "should update init_survey" do
    patch init_survey_url(@init_survey), params: { init_survey: { another_init: @init_survey.another_init, cough_init: @init_survey.cough_init, difficulty_breathing_init: @init_survey.difficulty_breathing_init, fatigue_init: @init_survey.fatigue_init, muscle_pain_init: @init_survey.muscle_pain_init, nasal_congestion_init: @init_survey.nasal_congestion_init, new_temperature_init: @init_survey.new_temperature_init, respiratory_init: @init_survey.respiratory_init, shaking_chills_init: @init_survey.shaking_chills_init, sore_throat_init: @init_survey.sore_throat_init, temperature_init: @init_survey.temperature_init } }
    assert_redirected_to init_survey_url(@init_survey)
  end

  test "should destroy init_survey" do
    assert_difference('InitSurvey.count', -1) do
      delete init_survey_url(@init_survey)
    end

    assert_redirected_to init_surveys_url
  end
end
