require 'test_helper'

class RssPostsControllerTest < ActionController::TestCase
  setup do
    @rss_post = rss_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rss_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rss_post" do
    assert_difference('RssPost.count') do
      post :create, :rss_post => @rss_post.attributes
    end

    assert_redirected_to rss_post_path(assigns(:rss_post))
  end

  test "should show rss_post" do
    get :show, :id => @rss_post.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rss_post.to_param
    assert_response :success
  end

  test "should update rss_post" do
    put :update, :id => @rss_post.to_param, :rss_post => @rss_post.attributes
    assert_redirected_to rss_post_path(assigns(:rss_post))
  end

  test "should destroy rss_post" do
    assert_difference('RssPost.count', -1) do
      delete :destroy, :id => @rss_post.to_param
    end

    assert_redirected_to rss_posts_path
  end
end
