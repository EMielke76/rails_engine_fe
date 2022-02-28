class MerchantsController < ApplicationController

  def index
    @merchants = MerchantFacade.new
  end

  def show
    merchant = MerchantFacade.new
    items = MerchantFacade.new
    @merchant = merchant.find_merchant(params[:id])
    @items = items.find_merchant_items(params[:id])
  end
end
