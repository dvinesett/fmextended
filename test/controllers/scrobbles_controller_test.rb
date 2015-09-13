require 'test_helper'

class ScrobblesControllerTest < ActionController::TestCase
  setup do
    @scrobble = scrobbles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scrobbles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scrobble" do
    assert_difference('Scrobble.count') do
      post :create, scrobble: { albumname: @scrobble.albumname, application: @scrobble.application, artistname: @scrobble.artistname, time: @scrobble.time, trackname: @scrobble.trackname }
    end

    assert_redirected_to scrobble_path(assigns(:scrobble))
  end

  test "should show scrobble" do
    get :show, id: @scrobble
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scrobble
    assert_response :success
  end

  test "should update scrobble" do
    patch :update, id: @scrobble, scrobble: { albumname: @scrobble.albumname, application: @scrobble.application, artistname: @scrobble.artistname, time: @scrobble.time, trackname: @scrobble.trackname }
    assert_redirected_to scrobble_path(assigns(:scrobble))
  end

  test "should destroy scrobble" do
    assert_difference('Scrobble.count', -1) do
      delete :destroy, id: @scrobble
    end

    assert_redirected_to scrobbles_path
  end
end
