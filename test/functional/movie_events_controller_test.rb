require 'test_helper'

class MovieEventsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie_event" do
    assert_difference('MovieEvent.count') do
      post :create, :movie_event => { }
    end

    assert_redirected_to movie_event_path(assigns(:movie_event))
  end

  test "should show movie_event" do
    get :show, :id => movie_events(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => movie_events(:one).to_param
    assert_response :success
  end

  test "should update movie_event" do
    put :update, :id => movie_events(:one).to_param, :movie_event => { }
    assert_redirected_to movie_event_path(assigns(:movie_event))
  end

  test "should destroy movie_event" do
    assert_difference('MovieEvent.count', -1) do
      delete :destroy, :id => movie_events(:one).to_param
    end

    assert_redirected_to movie_events_path
  end
end
