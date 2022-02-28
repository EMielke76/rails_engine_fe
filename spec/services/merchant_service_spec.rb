require 'rails_helper'

RSpec.describe MerchantService do
  context 'instance methods' do
    context '.find_all_merchants' do
      it 'returns merchant data' do
        VCR.use_cassette('rails-engine_merchants_index') do
          merchant = MerchantService.new
          merchants = merchant.find_all_merchants

          expect(merchants).to be_a(Hash)

          merchant_data = merchants[:data]

          merchant_data.each do |data|
            expect(data).to have_key(:id)
            expect(data[:id]).to be_a(String)

            expect(data).to have_key(:type)
            expect(data[:type]).to eq('merchant')

            expect(data).to have_key(:attributes)
            expect(data[:attributes]).to be_a(Hash)

            merchant_attributes = data[:attributes]

            expect(merchant_attributes).to have_key(:name)
            expect(merchant_attributes[:name]).to be_a(String)
          end
        end
      end
    end

    context '#find_merchant(id)' do
      it 'returns a single merchants data' do
        VCR.use_cassette('get_a_merchant') do
          merchant = MerchantService.new
          a_merchant = merchant.find_merchant(1)

          expect(a_merchant).to be_a(Hash)

          expect(a_merchant).to have_key(:data)
          expect(a_merchant[:data].count).to eq(3)

          merchant_data = a_merchant[:data]
          expect(merchant_data).to have_key(:id)
          expect(merchant_data[:id]).to be_a(String)

          expect(merchant_data).to have_key(:type)
          expect(merchant_data[:type]).to eq('merchant')

          expect(merchant_data).to have_key(:attributes)
          expect(merchant_data[:attributes]).to be_a(Hash)

          merchant_attributes = merchant_data[:attributes]

          expect(merchant_attributes).to have_key(:name)
          expect(merchant_attributes[:name]).to be_a(String)
        end
      end
    end

    context '#find_merchant_items(id)' do
      it 'returns a merchants items data' do
        VCR.use_cassette('get_a_merchants_items') do
          merchant = MerchantService.new
          items = merchant.find_merchant_items(1)

          expect(items).to be_a(Hash)
          expect(items).to have_key(:data)

          items_data = items[:data]

          items_data.each do |item|
            expect(item).to have_key(:id)
            expect(item[:id]).to be_a(String)

            expect(item).to have_key(:type)
            expect(item[:type]).to eq("item")

            expect(item).to have_key(:attributes)
            expect(item[:attributes]).to be_a(Hash)

            item_attributes = item[:attributes]

            expect(item_attributes).to have_key(:name)
            expect(item_attributes[:name]).to be_a(String)

            expect(item_attributes).to have_key(:description)
            expect(item_attributes[:description]).to be_a(String)

            expect(item_attributes).to have_key(:unit_price)
            expect(item_attributes[:unit_price]).to be_a(Float)

            expect(item_attributes).to have_key(:merchant_id)
            expect(item_attributes[:merchant_id]).to be_a(Integer)
          end
        end
      end
    end
  end
end
