require 'test_helper'

class EmployersControllerTest < ActionController::TestCase
  setup do
    @employer = employers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employer" do
    assert_difference('Employer.count') do
      post :create, employer: { city: @employer.city, country: @employer.country, descr0_full: @employer.descr0_full, descr0_title: @employer.descr0_title, descr1_full: @employer.descr1_full, descr1_title: @employer.descr1_title, descr2_full: @employer.descr2_full, descr2_title: @employer.descr2_title, label: @employer.label, logo: @employer.logo, name: @employer.name, photo: @employer.photo, sector: @employer.sector, video: @employer.video }
    end

    assert_redirected_to employer_path(assigns(:employer))
  end

  test "should show employer" do
    get :show, id: @employer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employer
    assert_response :success
  end

  test "should update employer" do
    patch :update, id: @employer, employer: { city: @employer.city, country: @employer.country, descr0_full: @employer.descr0_full, descr0_title: @employer.descr0_title, descr1_full: @employer.descr1_full, descr1_title: @employer.descr1_title, descr2_full: @employer.descr2_full, descr2_title: @employer.descr2_title, label: @employer.label, logo: @employer.logo, name: @employer.name, photo: @employer.photo, sector: @employer.sector, video: @employer.video }
    assert_redirected_to employer_path(assigns(:employer))
  end

  test "should destroy employer" do
    assert_difference('Employer.count', -1) do
      delete :destroy, id: @employer
    end

    assert_redirected_to employers_path
  end
end
