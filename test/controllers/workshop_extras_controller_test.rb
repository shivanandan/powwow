require 'test_helper'

class WorkshopExtrasControllerTest < ActionController::TestCase
  setup do
    @workshop_extra = workshop_extras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workshop_extras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workshop_extra" do
    assert_difference('WorkshopExtra.count') do
      post :create, workshop_extra: { description: @workshop_extra.description, link: @workshop_extra.link, title: @workshop_extra.title }
    end

    assert_redirected_to workshop_extra_path(assigns(:workshop_extra))
  end

  test "should show workshop_extra" do
    get :show, id: @workshop_extra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workshop_extra
    assert_response :success
  end

  test "should update workshop_extra" do
    patch :update, id: @workshop_extra, workshop_extra: { description: @workshop_extra.description, link: @workshop_extra.link, title: @workshop_extra.title }
    assert_redirected_to workshop_extra_path(assigns(:workshop_extra))
  end

  test "should destroy workshop_extra" do
    assert_difference('WorkshopExtra.count', -1) do
      delete :destroy, id: @workshop_extra
    end

    assert_redirected_to workshop_extras_path
  end
end
