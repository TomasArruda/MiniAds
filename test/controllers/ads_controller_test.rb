require 'test_helper'

class AdsControllerTest < ActionController::TestCase

  setup do
    @ad1 = ads(:normal)
    @ad2 = ads(:noBudget)

    @creative1 = creatives(:normal)
    @creative2 = creatives(:greaterBid)
    @creative3 = creatives(:noBid)
    @creative4 = creatives(:noAdText)

    @targeting = targetings(:one)
    @place = places(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show post" do
    get :show, id: @ad1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ad1
    assert_response :success
  end

  #ad creation tests
  test "should create ad" do
    assert_difference('Ad.count') do
      post :create, ad: { budget: @ad1.budget, creatives_attributes: [ bid: @creative1.bid , adText:  @creative1.adText], targetings_attributes: [gender: @targeting.gender, places_attributes: [place: @place.place]]}
    end
    assert_redirected_to ads_path
  end

  test "shouldnt create ad no budget" do
    assert_no_difference('Ad.count') do
      post :create, ad: { budget: @ad2.budget, creatives_attributes: [ bid: @creative1.bid , adText:  @creative1.adText], targetings_attributes: [gender: @targeting.gender, places_attributes: [place: @place.place]]}
    end
  end

  test "shouldnt create ad bid greater than budget" do
    assert_no_difference('Ad.count') do
      post :create, ad: { budget: @ad1.budget, creatives_attributes: [ bid: @creative2.bid , adText:  @creative2.adText], targetings_attributes: [gender: @targeting.gender, places_attributes: [place: @place.place]]}
    end
  end

  test "shouldnt create ad creative with no bid" do
    assert_no_difference('Ad.count') do
      post :create, ad: { budget: @ad1.budget, creatives_attributes: [ bid: @creative3.bid , adText:  @creative3.adText], targetings_attributes: [gender: @targeting.gender, places_attributes: [place: @place.place]]}
    end
  end

  test "shouldnt create ad creative with no adText" do
    assert_no_difference('Ad.count') do
      post :create, ad: { budget: @ad1.budget, creatives_attributes: [ bid: @creative4.bid , adText:  @creative4.adText], targetings_attributes: [gender: @targeting.gender, places_attributes: [place: @place.place]]}
    end
  end

  test "shouldnt create ad no creative" do
    assert_no_difference('Ad.count') do
      post :create, ad: { budget: @ad1.budget, creatives_attributes: [], targetings_attributes: [gender: @targeting.gender, places_attributes: [place: @place.place]]}
    end
  end

  test "shouldnt create ad no targeting" do
    assert_no_difference('Ad.count') do
      post :create, ad: { budget: @ad1.budget, creatives_attributes: [bid: @creative1.bid , adText:  @creative1.adText], targetings_attributes: []}
    end
  end

  test "should update post" do
    patch :update, id: @ad1, ad: { budget: @ad1.budget, creatives_attributes: [ bid: @creative1.bid , adText:  @creative1.adText], targetings_attributes: [gender: @targeting.gender, places_attributes: [place: @place.place]]}
    assert_redirected_to ad_path(assigns(:ad))
  end

  test "should destroy post" do
    ad = Ad.first
    delete :destroy, :id => ad
    assert_redirected_to ads_url
    assert !Ad.exists?(ad.id)
  end


end
