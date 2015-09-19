require 'test_helper'

class PlannedPlacesControllerTest < ActionController::TestCase
  setup do
    @planned_place = planned_places(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planned_places)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planned_place" do
    assert_difference('PlannedPlace.count') do
      post :create, planned_place: { place_id: @planned_place.place_id, trip_id: @planned_place.trip_id, visit_time: @planned_place.visit_time, votes: @planned_place.votes }
    end

    assert_redirected_to planned_place_path(assigns(:planned_place))
  end

  test "should show planned_place" do
    get :show, id: @planned_place
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planned_place
    assert_response :success
  end

  test "should update planned_place" do
    patch :update, id: @planned_place, planned_place: { place_id: @planned_place.place_id, trip_id: @planned_place.trip_id, visit_time: @planned_place.visit_time, votes: @planned_place.votes }
    assert_redirected_to planned_place_path(assigns(:planned_place))
  end

  test "should destroy planned_place" do
    assert_difference('PlannedPlace.count', -1) do
      delete :destroy, id: @planned_place
    end

    assert_redirected_to planned_places_path
  end
end
