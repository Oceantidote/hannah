require 'test_helper'

class BatchDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @batch_day = batch_days(:one)
  end

  test "should get index" do
    get batch_days_url
    assert_response :success
  end

  test "should get new" do
    get new_batch_day_url
    assert_response :success
  end

  test "should create batch_day" do
    assert_difference('BatchDay.count') do
      post batch_days_url, params: { batch_day: { batch_id: @batch_day.batch_id, title: @batch_day.title } }
    end

    assert_redirected_to batch_day_url(BatchDay.last)
  end

  test "should show batch_day" do
    get batch_day_url(@batch_day)
    assert_response :success
  end

  test "should get edit" do
    get edit_batch_day_url(@batch_day)
    assert_response :success
  end

  test "should update batch_day" do
    patch batch_day_url(@batch_day), params: { batch_day: { batch_id: @batch_day.batch_id, title: @batch_day.title } }
    assert_redirected_to batch_day_url(@batch_day)
  end

  test "should destroy batch_day" do
    assert_difference('BatchDay.count', -1) do
      delete batch_day_url(@batch_day)
    end

    assert_redirected_to batch_days_url
  end
end
