require 'test_helper'

class UserSectionsControllerTest < ActionController::TestCase
  setup do
    @user_section = user_sections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_section" do
    assert_difference('UserSection.count') do
      post :create, user_section: { section_id: @user_section.section_id, user_id: @user_section.user_id }
    end

    assert_redirected_to user_section_path(assigns(:user_section))
  end

  test "should show user_section" do
    get :show, id: @user_section
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_section
    assert_response :success
  end

  test "should update user_section" do
    patch :update, id: @user_section, user_section: { section_id: @user_section.section_id, user_id: @user_section.user_id }
    assert_redirected_to user_section_path(assigns(:user_section))
  end

  test "should destroy user_section" do
    assert_difference('UserSection.count', -1) do
      delete :destroy, id: @user_section
    end

    assert_redirected_to user_sections_path
  end
end
