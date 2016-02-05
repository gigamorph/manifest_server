require 'test_helper'

class CanvasControllerTest < ActionController::TestCase
  setup do
    @canva = canvas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:canvas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create canva" do
    assert_difference('Canva.count') do
      post :create, canva: { a_id: @canva.a_id, a_type: @canva.a_type, height: @canva.height, label: @canva.label, width: @canva.width }
    end

    assert_redirected_to canva_path(assigns(:canva))
  end

  test "should show canva" do
    get :show, id: @canva
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @canva
    assert_response :success
  end

  test "should update canva" do
    patch :update, id: @canva, canva: { a_id: @canva.a_id, a_type: @canva.a_type, height: @canva.height, label: @canva.label, width: @canva.width }
    assert_redirected_to canva_path(assigns(:canva))
  end

  test "should destroy canva" do
    assert_difference('Canva.count', -1) do
      delete :destroy, id: @canva
    end

    assert_redirected_to canvas_path
  end
end
