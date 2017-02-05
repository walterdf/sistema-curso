require 'test_helper'

class DadosdeacessoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dadosdeacesso_index_url
    assert_response :success
  end

end
