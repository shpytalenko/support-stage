require 'test_helper'

class HistoriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => History.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    History.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    History.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to history_url(assigns(:history))
  end

  def test_edit
    get :edit, :id => History.first
    assert_template 'edit'
  end

  def test_update_invalid
    History.any_instance.stubs(:valid?).returns(false)
    put :update, :id => History.first
    assert_template 'edit'
  end

  def test_update_valid
    History.any_instance.stubs(:valid?).returns(true)
    put :update, :id => History.first
    assert_redirected_to history_url(assigns(:history))
  end

  def test_destroy
    history = History.first
    delete :destroy, :id => history
    assert_redirected_to histories_url
    assert !History.exists?(history.id)
  end
end
