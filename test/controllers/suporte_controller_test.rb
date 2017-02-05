require 'test_helper'

class SuporteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get suporte_index_url
    assert_response :success
  end

end
