require 'test_helper'

class RecordOfReadPostsControllerTest < ActionController::TestCase
  setup do
    @record_of_read_post = record_of_read_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:record_of_read_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create record_of_read_post" do
    assert_difference('RecordOfReadPost.count') do
      post :create, :record_of_read_post => @record_of_read_post.attributes
    end

    assert_redirected_to record_of_read_post_path(assigns(:record_of_read_post))
  end

  test "should show record_of_read_post" do
    get :show, :id => @record_of_read_post.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @record_of_read_post.to_param
    assert_response :success
  end

  test "should update record_of_read_post" do
    put :update, :id => @record_of_read_post.to_param, :record_of_read_post => @record_of_read_post.attributes
    assert_redirected_to record_of_read_post_path(assigns(:record_of_read_post))
  end

  test "should destroy record_of_read_post" do
    assert_difference('RecordOfReadPost.count', -1) do
      delete :destroy, :id => @record_of_read_post.to_param
    end

    assert_redirected_to record_of_read_posts_path
  end
end
