require 'test_helper'

class DadoscadastraisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dadoscadastrais_index_url
    assert_response :success
  end

end
