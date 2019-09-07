require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post accounts_url, params: { account: { account_string: @account.account_string, d1: @account.d1, d2: @account.d2, d3: @account.d3, d4: @account.d4, d5: @account.d5, d6: @account.d6, d7: @account.d7, d8: @account.d8, d9: @account.d9, input: @account.input, status: @account.status, upload_id: @account.upload_id } }
    end

    assert_redirected_to account_url(Account.last)
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(@account)
    assert_response :success
  end

  test "should update account" do
    patch account_url(@account), params: { account: { account_string: @account.account_string, d1: @account.d1, d2: @account.d2, d3: @account.d3, d4: @account.d4, d5: @account.d5, d6: @account.d6, d7: @account.d7, d8: @account.d8, d9: @account.d9, input: @account.input, status: @account.status, upload_id: @account.upload_id } }
    assert_redirected_to account_url(@account)
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end
end
