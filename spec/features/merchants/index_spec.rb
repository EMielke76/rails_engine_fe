require 'rails_helper'

RSpec.describe 'merchant index page' do
  it 'displays all merchants by name', :vcr do

    visit merchants_path

    expect(page).to have_content("Merchants")

    within("#merchants_index_id_1") do
      expect(page).to have_content("Name: Schroeder-Jerde")
    end

    within("#merchants_index_id_2") do
      expect(page).to have_content("Name: Klein, Rempel and Jones")
    end
  end

  it 'links to each merchants show page via their name', :vcr do
    visit merchants_path

    within("#merchants_index_id_1") do
      VCR.use_cassette('merchants_show_shroeder') do
        expect(page).to have_link("Schroeder-Jerde")
        click_on "Schroeder-Jerde"
        expect(current_path).to eq('/merchants/1')
      end
    end

    visit merchants_path

    within("#merchants_index_id_2") do
      VCR.use_cassette('merchants_show_klein') do
        expect(page).to have_link("Klein, Rempel and Jones")
        click_on "Klein, Rempel and Jones"
        expect(current_path).to eq('/merchants/2')
      end
    end
  end
end
