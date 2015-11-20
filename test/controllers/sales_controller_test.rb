# -*- encoding : utf-8 -*-
require 'test_helper'

class SalesControllerTest < ActionController::TestCase
  setup do
    @sale = sales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales)
  end

  test "should create sale" do
    file = fixture_file_upload('files/valid.txt', 'text/txt')
    assert_difference('Sale.count') do
      post :create, sale: { upload_file: file }
    end

    assert_redirected_to sales_path
  end

  test "should destroy sale" do
    assert_difference('Sale.count', -1) do
      delete :destroy, id: @sale
    end

    assert_redirected_to sales_path
  end
end
