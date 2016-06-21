class CreativesController < ApplicationController

  def index
    @creatives = Creative.paginate(:page       => params[:page],
                       :per_page   => 10)
  end

  def show
    @creatives = Creative.find params[:id]
  end

  def new
    @creative = Creative.new
  end

  def create
    @creative = Creative.new(creative_params)
    @creative.save
    flash[:success] = 'creative saved.'
    redirect_to creatives_path
  end

  def edit

  end

  def update
    if @creative.update_attributes(creative_params)
      flash[:success] = "creative updated."
      redirect_to ads_url
    else
      render 'edit'
    end
  end

  def destroy
    Creative.find(params[:id]).destroy
    flash[:success] = "Ad destroyed."
    redirect_to creatives_url
  end

  private

  def creative_params
    params.require(:creative).permit(:bid, :adText, :ads_id)
  end

end
