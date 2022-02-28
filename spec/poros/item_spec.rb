require 'rails_helper'

RSpec.describe Item do
  let!(:attributes) {
    {
      id: "1",
      attributes: { name: "This is an item",
                    description: "This is a description. Long one at that.",
                    unit_price: 12.45,
                    merchant_id: 1
                  }
    }
  }

  let!(:item) { Item.new(attributes) }

  it 'exists' do
    expect(item).to be_a(Item)
  end

  it 'has attributes' do
    expect(item.id).to be_a(String)
    expect(item.name).to eq("This is an item")
    expect(item.description).to eq("This is a description. Long one at that.")
    expect(item.unit_price).to eq(12.45)
    expect(item.merchant_id).to eq(1) 
  end
end
