require "test_helper"

class TransactionCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction_code = transaction_codes(:one)
  end

  test "should get index" do
    get transaction_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_transaction_code_url
    assert_response :success
  end

  test "should create transaction_code" do
    assert_difference('TransactionCode.count') do
      post transaction_codes_url, params: { transaction_code: { cdt_code: @transaction_code.cdt_code, description: @transaction_code.description, entry_type: @transaction_code.entry_type, title: @transaction_code.title } }
    end

    assert_redirected_to transaction_code_url(TransactionCode.last)
  end

  test "should show transaction_code" do
    get transaction_code_url(@transaction_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaction_code_url(@transaction_code)
    assert_response :success
  end

  test "should update transaction_code" do
    patch transaction_code_url(@transaction_code), params: { transaction_code: { cdt_code: @transaction_code.cdt_code, description: @transaction_code.description, entry_type: @transaction_code.entry_type, title: @transaction_code.title } }
    assert_redirected_to transaction_code_url(@transaction_code)
  end

  test "should destroy transaction_code" do
    assert_difference('TransactionCode.count', -1) do
      delete transaction_code_url(@transaction_code)
    end

    assert_redirected_to transaction_codes_url
  end
end
