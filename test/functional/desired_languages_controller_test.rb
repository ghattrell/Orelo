require 'test_helper'

class DesiredLanguagesControllerTest < ActionController::TestCase
  setup do
    @desired_language = desired_languages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:desired_languages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create desired_language" do
    assert_difference('DesiredLanguage.count') do
      post :create, desired_language: { language_id: @desired_language.language_id, user_id: @desired_language.user_id }
    end

    assert_redirected_to desired_language_path(assigns(:desired_language))
  end

  test "should show desired_language" do
    get :show, id: @desired_language
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @desired_language
    assert_response :success
  end

  test "should update desired_language" do
    put :update, id: @desired_language, desired_language: { language_id: @desired_language.language_id, user_id: @desired_language.user_id }
    assert_redirected_to desired_language_path(assigns(:desired_language))
  end

  test "should destroy desired_language" do
    assert_difference('DesiredLanguage.count', -1) do
      delete :destroy, id: @desired_language
    end

    assert_redirected_to desired_languages_path
  end
end
