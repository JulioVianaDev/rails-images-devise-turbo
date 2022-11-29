require "test_helper"

class PensamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pensament = pensaments(:one)
  end

  test "should get index" do
    get pensaments_url
    assert_response :success
  end

  test "should get new" do
    get new_pensament_url
    assert_response :success
  end

  test "should create pensament" do
    assert_difference("Pensament.count") do
      post pensaments_url, params: { pensament: { description: @pensament.description, user_id: @pensament.user_id } }
    end

    assert_redirected_to pensament_url(Pensament.last)
  end

  test "should show pensament" do
    get pensament_url(@pensament)
    assert_response :success
  end

  test "should get edit" do
    get edit_pensament_url(@pensament)
    assert_response :success
  end

  test "should update pensament" do
    patch pensament_url(@pensament), params: { pensament: { description: @pensament.description, user_id: @pensament.user_id } }
    assert_redirected_to pensament_url(@pensament)
  end

  test "should destroy pensament" do
    assert_difference("Pensament.count", -1) do
      delete pensament_url(@pensament)
    end

    assert_redirected_to pensaments_url
  end
end
