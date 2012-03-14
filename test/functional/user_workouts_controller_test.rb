require 'test_helper'

class UserWorkoutsControllerTest < ActionController::TestCase
  setup do
    @user_workout = user_workouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_workouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_workout" do
    assert_difference('UserWorkout.count') do
      post :create, user_workout: @user_workout.attributes
    end

    assert_redirected_to user_workout_path(assigns(:user_workout))
  end

  test "should show user_workout" do
    get :show, id: @user_workout
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_workout
    assert_response :success
  end

  test "should update user_workout" do
    put :update, id: @user_workout, user_workout: @user_workout.attributes
    assert_redirected_to user_workout_path(assigns(:user_workout))
  end

  test "should destroy user_workout" do
    assert_difference('UserWorkout.count', -1) do
      delete :destroy, id: @user_workout
    end

    assert_redirected_to user_workouts_path
  end
end
