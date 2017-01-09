require 'test_helper'

class OffersControllerTest < ActionController::TestCase
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post :create, offer: { apply: @offer.apply, candidate_profile: @offer.candidate_profile, city: @offer.city, country: @offer.country, deadline: @offer.deadline, employer: @offer.employer, job_description: @offer.job_description, label: @offer.label, name: @offer.name, offer: @offer.offer, organisation_description: @offer.organisation_description, posted: @offer.posted, salary: @offer.salary, sector: @offer.sector, type: @offer.type }
    end

    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should show offer" do
    get :show, id: @offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offer
    assert_response :success
  end

  test "should update offer" do
    patch :update, id: @offer, offer: { apply: @offer.apply, candidate_profile: @offer.candidate_profile, city: @offer.city, country: @offer.country, deadline: @offer.deadline, employer: @offer.employer, job_description: @offer.job_description, label: @offer.label, name: @offer.name, offer: @offer.offer, organisation_description: @offer.organisation_description, posted: @offer.posted, salary: @offer.salary, sector: @offer.sector, type: @offer.type }
    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete :destroy, id: @offer
    end

    assert_redirected_to offers_path
  end
end
