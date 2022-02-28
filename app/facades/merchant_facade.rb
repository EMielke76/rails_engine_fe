class MerchantFacade

  def all_merchants
    service.find_all_merchants[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end

  def find_merchant(id)
    Merchant.new(service.find_merchant(id)[:data])
  end

  def find_merchant_items(id)
    service.find_merchant_items(id)[:data].map do |item_data|
      Item.new(item_data)
    end
  end

  def service
    MerchantService.new
  end
end
