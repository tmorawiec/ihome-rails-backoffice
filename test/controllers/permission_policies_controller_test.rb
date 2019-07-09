require 'test_helper'

class PermissionPoliciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permission_policy = permission_policies(:one)
  end

  test "should get index" do
    get permission_policies_url
    assert_response :success
  end

  test "should get new" do
    get new_permission_policy_url
    assert_response :success
  end

  test "should create permission_policy" do
    assert_difference('PermissionPolicy.count') do
      post permission_policies_url, params: { permission_policy: { io1: @permission_policy.io1, io2: @permission_policy.io2, io3: @permission_policy.io3, io4: @permission_policy.io4, name: @permission_policy.name } }
    end

    assert_redirected_to permission_policy_url(PermissionPolicy.last)
  end

  test "should show permission_policy" do
    get permission_policy_url(@permission_policy)
    assert_response :success
  end

  test "should get edit" do
    get edit_permission_policy_url(@permission_policy)
    assert_response :success
  end

  test "should update permission_policy" do
    patch permission_policy_url(@permission_policy), params: { permission_policy: { io1: @permission_policy.io1, io2: @permission_policy.io2, io3: @permission_policy.io3, io4: @permission_policy.io4, name: @permission_policy.name } }
    assert_redirected_to permission_policy_url(@permission_policy)
  end

  test "should destroy permission_policy" do
    assert_difference('PermissionPolicy.count', -1) do
      delete permission_policy_url(@permission_policy)
    end

    assert_redirected_to permission_policies_url
  end
end
