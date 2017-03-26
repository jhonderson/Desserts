require 'test_helper'

class DessertsControllerTest < ActionController::TestCase
  setup do
    @dessert = desserts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:desserts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dessert" do
    assert_difference('Dessert.count') do
      post :create, dessert: { description: @dessert.description, desserts_category_id: @dessert.desserts_category_id, image_url: @dessert.image_url, name: @dessert.name, retail_price: @dessert.retail_price, wholesale_price: @dessert.wholesale_price }
    end

    assert_redirected_to dessert_path(assigns(:dessert))
  end

  test "should show dessert" do
    get :show, id: @dessert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dessert
    assert_response :success
  end

  test "should update dessert" do
    patch :update, id: @dessert, dessert: { description: @dessert.description, desserts_category_id: @dessert.desserts_category_id, image_url: @dessert.image_url, name: @dessert.name, retail_price: @dessert.retail_price, wholesale_price: @dessert.wholesale_price }
    assert_redirected_to dessert_path(assigns(:dessert))
  end

  test "should destroy dessert" do
    assert_difference('Dessert.count', -1) do
      delete :destroy, id: @dessert
    end

    assert_redirected_to desserts_path
  end
end
