require 'faraday'
require 'json'

class MerchantService
  def find_all_merchants
    response = conn.get("/api/v1/merchants")
    body = parse_json(response)
    
  end

  private

  def conn
    Faraday.new(url: "http://localhost:3000")
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
