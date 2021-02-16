require "test_helper"

class EntsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ent = ents(:one)
  end

  test "should get index" do
    get ents_url
    assert_response :success
  end

  test "should get new" do
    get new_ent_url
    assert_response :success
  end

  test "should create ent" do
    assert_difference('Ent.count') do
      post ents_url, params: { ent: { category: @ent.category, name: @ent.name, reviewid: @ent.reviewid } }
    end

    assert_redirected_to ent_url(Ent.last)
  end

  test "should show ent" do
    get ent_url(@ent)
    assert_response :success
  end

  test "should get edit" do
    get edit_ent_url(@ent)
    assert_response :success
  end

  test "should update ent" do
    patch ent_url(@ent), params: { ent: { category: @ent.category, name: @ent.name, reviewid: @ent.reviewid } }
    assert_redirected_to ent_url(@ent)
  end

  test "should destroy ent" do
    assert_difference('Ent.count', -1) do
      delete ent_url(@ent)
    end

    assert_redirected_to ents_url
  end
end
