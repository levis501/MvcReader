require 'test_helper'

class PostReadRecordsControllerTest < ActionController::TestCase
  setup do
    @post_read_record = post_read_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_read_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_read_record" do
    assert_difference('PostReadRecord.count') do
      post :create, :post_read_record => @post_read_record.attributes
    end

    assert_redirected_to post_read_record_path(assigns(:post_read_record))
  end

  test "should show post_read_record" do
    get :show, :id => @post_read_record.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @post_read_record.to_param
    assert_response :success
  end

  test "should update post_read_record" do
    put :update, :id => @post_read_record.to_param, :post_read_record => @post_read_record.attributes
    assert_redirected_to post_read_record_path(assigns(:post_read_record))
  end

  test "should destroy post_read_record" do
    assert_difference('PostReadRecord.count', -1) do
      delete :destroy, :id => @post_read_record.to_param
    end

    assert_redirected_to post_read_records_path
  end
end
