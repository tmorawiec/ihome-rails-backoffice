require "application_system_test_case"

class PermissionPoliciesTest < ApplicationSystemTestCase
  setup do
    @permission_policy = permission_policies(:one)
  end

  test "visiting the index" do
    visit permission_policies_url
    assert_selector "h1", text: "Permission Policies"
  end

  test "creating a Permission policy" do
    visit permission_policies_url
    click_on "New Permission Policy"

    check "Io1" if @permission_policy.io1
    check "Io2" if @permission_policy.io2
    check "Io3" if @permission_policy.io3
    check "Io4" if @permission_policy.io4
    fill_in "Name", with: @permission_policy.name
    click_on "Create Permission policy"

    assert_text "Permission policy was successfully created"
    click_on "Back"
  end

  test "updating a Permission policy" do
    visit permission_policies_url
    click_on "Edit", match: :first

    check "Io1" if @permission_policy.io1
    check "Io2" if @permission_policy.io2
    check "Io3" if @permission_policy.io3
    check "Io4" if @permission_policy.io4
    fill_in "Name", with: @permission_policy.name
    click_on "Update Permission policy"

    assert_text "Permission policy was successfully updated"
    click_on "Back"
  end

  test "destroying a Permission policy" do
    visit permission_policies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Permission policy was successfully destroyed"
  end
end
