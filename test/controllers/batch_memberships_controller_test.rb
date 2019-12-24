require 'test_helper'

class BatchMembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @batch_membership = batch_memberships(:one)
  end

  test "should get index" do
    get batch_memberships_url
    assert_response :success
  end

  test "should get new" do
    get new_batch_membership_url
    assert_response :success
  end

  test "should create batch_membership" do
    assert_difference('BatchMembership.count') do
      post batch_memberships_url, params: { batch_membership: { batch_id: @batch_membership.batch_id, user_id: @batch_membership.user_id } }
    end

    assert_redirected_to batch_membership_url(BatchMembership.last)
  end

  test "should show batch_membership" do
    get batch_membership_url(@batch_membership)
    assert_response :success
  end

  test "should get edit" do
    get edit_batch_membership_url(@batch_membership)
    assert_response :success
  end

  test "should update batch_membership" do
    patch batch_membership_url(@batch_membership), params: { batch_membership: { batch_id: @batch_membership.batch_id, user_id: @batch_membership.user_id } }
    assert_redirected_to batch_membership_url(@batch_membership)
  end

  test "should destroy batch_membership" do
    assert_difference('BatchMembership.count', -1) do
      delete batch_membership_url(@batch_membership)
    end

    assert_redirected_to batch_memberships_url
  end
end
