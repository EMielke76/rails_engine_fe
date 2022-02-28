require 'rails_helper'

RSpec.describe 'merchant show page' do
  it 'displays each items information that a merchant sells', :vcr do
    visit merchant_path(1)

    expect(page).to have_content("Schroeder-Jerde's Information")
    expect(page).to have_content("Items")
    save_and_open_page
    within("#items_id_4") do
      expect(page).to have_content("Name: Item Nemo Facere")
      expect(page).to have_content("Description: Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.")
      expect(page).to have_content("Unit Price: 42.91")
    end
  end
end
