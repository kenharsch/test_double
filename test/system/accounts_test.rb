require "application_system_test_case"

class AccountsTest < ApplicationSystemTestCase
  setup do
    @account = accounts(:one)
  end

  test "visiting the index" do
    visit accounts_url
    assert_selector "h1", text: "Accounts"
  end

  test "creating a Account" do
    visit accounts_url
    click_on "New Account"

    fill_in "Account string", with: @account.account_string
    fill_in "D1", with: @account.d1
    fill_in "D2", with: @account.d2
    fill_in "D3", with: @account.d3
    fill_in "D4", with: @account.d4
    fill_in "D5", with: @account.d5
    fill_in "D6", with: @account.d6
    fill_in "D7", with: @account.d7
    fill_in "D8", with: @account.d8
    fill_in "D9", with: @account.d9
    fill_in "Input", with: @account.input
    fill_in "Status", with: @account.status
    fill_in "Upload", with: @account.upload_id
    click_on "Create Account"

    assert_text "Account was successfully created"
    click_on "Back"
  end

  test "updating a Account" do
    visit accounts_url
    click_on "Edit", match: :first

    fill_in "Account string", with: @account.account_string
    fill_in "D1", with: @account.d1
    fill_in "D2", with: @account.d2
    fill_in "D3", with: @account.d3
    fill_in "D4", with: @account.d4
    fill_in "D5", with: @account.d5
    fill_in "D6", with: @account.d6
    fill_in "D7", with: @account.d7
    fill_in "D8", with: @account.d8
    fill_in "D9", with: @account.d9
    fill_in "Input", with: @account.input
    fill_in "Status", with: @account.status
    fill_in "Upload", with: @account.upload_id
    click_on "Update Account"

    assert_text "Account was successfully updated"
    click_on "Back"
  end

  test "destroying a Account" do
    visit accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Account was successfully destroyed"
  end
end
