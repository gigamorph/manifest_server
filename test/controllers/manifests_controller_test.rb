require 'test_helper'

class ManifestsControllerTest < ActionController::TestCase
  setup do
    @manifest = manifests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manifests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manifest" do
    assert_difference('Manifest.count') do
      post :create, manifest: { a_context: @manifest.a_context, a_id: @manifest.a_id, a_type: @manifest.a_type, label: @manifest.label }
    end

    assert_redirected_to manifest_path(assigns(:manifest))
  end

  test "should show manifest" do
    get :show, id: @manifest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manifest
    assert_response :success
  end

  test "should update manifest" do
    patch :update, id: @manifest, manifest: { a_context: @manifest.a_context, a_id: @manifest.a_id, a_type: @manifest.a_type, label: @manifest.label }
    assert_redirected_to manifest_path(assigns(:manifest))
  end

  test "should destroy manifest" do
    assert_difference('Manifest.count', -1) do
      delete :destroy, id: @manifest
    end

    assert_redirected_to manifests_path
  end
end
