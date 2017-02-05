require 'test_helper'

class MeusCursosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meus_cursos_index_url
    assert_response :success
  end

end
