require 'test_helper'

class MaintenanceHistoriesControllerTest < ActionController::TestCase
  setup do
    @maintenance_history = maintenance_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintenance_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintenance_history" do
    assert_difference('MaintenanceHistory.count') do
      post :create, maintenance_history: { item: @maintenance_history.item, item_description: @maintenance_history.item_description, maintenance_cost: @maintenance_history.maintenance_cost, maintenance_date: @maintenance_history.maintenance_date, mileage: @maintenance_history.mileage, repair_shop: @maintenance_history.repair_shop, repair_shop_location: @maintenance_history.repair_shop_location, repair_shop_phone: @maintenance_history.repair_shop_phone, vechicle_id: @maintenance_history.vechicle_id }
    end

    assert_redirected_to maintenance_history_path(assigns(:maintenance_history))
  end

  test "should show maintenance_history" do
    get :show, id: @maintenance_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maintenance_history
    assert_response :success
  end

  test "should update maintenance_history" do
    patch :update, id: @maintenance_history, maintenance_history: { item: @maintenance_history.item, item_description: @maintenance_history.item_description, maintenance_cost: @maintenance_history.maintenance_cost, maintenance_date: @maintenance_history.maintenance_date, mileage: @maintenance_history.mileage, repair_shop: @maintenance_history.repair_shop, repair_shop_location: @maintenance_history.repair_shop_location, repair_shop_phone: @maintenance_history.repair_shop_phone, vechicle_id: @maintenance_history.vechicle_id }
    assert_redirected_to maintenance_history_path(assigns(:maintenance_history))
  end

  test "should destroy maintenance_history" do
    assert_difference('MaintenanceHistory.count', -1) do
      delete :destroy, id: @maintenance_history
    end

    assert_redirected_to maintenance_histories_path
  end
end
