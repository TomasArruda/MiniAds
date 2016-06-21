class AdsController < ApplicationController

  def index
    @ads = Ad.paginate(:page       => params[:page],
                        :per_page   => 10)
  end

  def show
    @ad = Ad.find params[:id]
  end

  def new
    @ad = Ad.new
    @ad.creatives.build
    targeting = @ad.targetings.build
    targeting.places.build
  end

  def create
    @ad = Ad.new(ad_params)
    if validate
      if @ad.save
        redirect_to ads_path
      else
        render :new
      end
    else
      @ad.errors[:base] <<"Any creative has invalid Bid."
      render :new
    end
  end

  def edit
    @ad = Ad.find params[:id]
    @ad.creatives.build
    targeting = @ad.targetings.build
    targeting.places.build
  end

  def update
    @ad = Ad.find params[:id]
    if validate
      if @ad.update_attributes(ad_params)
        redirect_to ad_url
      else
        render :edit
      end
    else
      @ad.errors[:base] <<"Any creative has invalid Bid."
      render :new
    end
  end

  def destroy
    Ad.find(params[:id]).destroy
    redirect_to ads_path

  end

  def validate
    r = true
    if ad_params[:creatives_attributes] != nil
      ad_params[:creatives_attributes].each do |k, v|
        if v != nil #checagem pois v, por alguma razao, está sendo retornado como nil na execução dos testes e o valor de v está sendo atribuido a k
          if ad_params[:budget] != '' && v[:bid] != ''
            if ad_params[:budget].to_i <= v[:bid].to_i
              r = false
            end
          end
        else
          if ad_params[:budget] != '' && k[:bid] != ''
            if ad_params[:budget].to_i <= k[:bid].to_i
              r = false
            end
          end
        end
      end
    end
    return r
  end

  private
  def ad_params
    params.require(:ad).permit(:budget, :_destroy, creatives_attributes: [ :id, :bid, :adText, :_destroy], targetings_attributes: [:id, :gender, :_destroy, places_attributes: [:id, :place, :_destroy]])
  end

end
