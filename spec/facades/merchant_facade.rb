require 'rails_helper'

RSpec.describe MerchantFacade do
  context 'instancne methods' do
    context '#all_merchants' do
      it 'returns Merchant data', :vcr do
        merchant = MerchantFacade.new
        merchants = merchant.all_merchants
        expect(merchants).to be_a(Array)

        merchants.each do |merchant|
          expect(merchant).to be_a(Merchant)
        end
      end
    end

    context '#find_merchant(id)' do
      it 'returns a single merchants data', :vcr do
        merchants = MerchantFacade.new
        merchant = merchants.find_merchant(1)

        expect(merchant).to be_a(Merchant)
        expect(merchant.id).to be_a(Integer)
        expect(merchant.name).to be_a(String)
      end
    end

    context '#find_merchant_items(id)', :vcr do
      it 'returns item data' do
        merchant = MerchantFacade.new
        items = merchant.find_merchant_items(1)
        expect(items).to be_a(Array)

        items.each do |item|
          expect(item).to be_a(Item)
        end
      end
    end
  end
end
