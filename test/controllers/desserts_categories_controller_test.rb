require 'test_helper'

class DessertsCategoriesControllerTest < ActionController::TestCase
  setup do
    @desserts_category = desserts_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:desserts_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create desserts_category" do
    assert_difference('DessertsCategory.count') do
      post :create, desserts_category: { image_url: @desserts_category.image_url, name: @desserts_category.name }
    end

    assert_redirected_to desserts_category_path(assigns(:desserts_category))
  end

  test "should show desserts_category" do
    get :show, id: @desserts_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @desserts_category
    assert_response :success
  end

  test "should update desserts_category" do
    patch :update, id: @desserts_category, desserts_category: { image_url: @desserts_category.image_url, name: @desserts_category.name }
    assert_redirected_to desserts_category_path(assigns(:desserts_category))
  end

  test "should destroy desserts_category" do
    assert_difference('DessertsCategory.count', -1) do
      delete :destroy, id: @desserts_category
    end

    assert_redirected_to desserts_categories_path
  end
end
