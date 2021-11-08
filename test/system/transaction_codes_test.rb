require "application_system_test_case"

class TransactionCodesTest < ApplicationSystemTestCase
  setup do
    @transaction_code = transaction_codes(:one)
  end

  test "visiting the index" do
    visit transaction_codes_url
    assert_selector "h1", text: "Transaction Codes"
  end

  test "creating a Transaction code" do
    visit transaction_codes_url
    click_on "New Transaction Code"

    fill_in "Cdt code", with: @transaction_code.cdt_code
    fill_in "Description", with: @transaction_code.description
    fill_in "Entry type", with: @transaction_code.entry_type
    fill_in "Title", with: @transaction_code.title
    click_on "Create Transaction code"

    assert_text "Transaction code was successfully created"
    click_on "Back"
  end

  test "updating a Transaction code" do
    visit transaction_codes_url
    click_on "Edit", match: :first

    fill_in "Cdt code", with: @transaction_code.cdt_code
    fill_in "Description", with: @transaction_code.description
    fill_in "Entry type", with: @transaction_code.entry_type
    fill_in "Title", with: @transaction_code.title
    click_on "Update Transaction code"

    assert_text "Transaction code was successfully updated"
    click_on "Back"
  end

  test "destroying a Transaction code" do
    visit transaction_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transaction code was successfully destroyed"
  end
end
