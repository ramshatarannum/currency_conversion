# app/services/currency_conversion_service.rb

require 'net/http'
require 'json'

class CurrencyConversionService
  BASE_URL = "https://v6.exchangerate-api.com/v6/#{ENV['FREECURRENCYAPI_API_KEY']}/latest/"

  def initialize(original_currency, target_currency, amount)
    @original_currency = original_currency
    @target_currency = target_currency
    @amount = amount
  end

  def call
    uri = URI("#{BASE_URL}#{@original_currency}")
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)

    if data["result"] == "success"
      rate = data["conversion_rates"][@target_currency]
      converted_amount = @amount * rate

      { 
        original_currency: @original_currency,
        target_currency: @target_currency,
        original_amount: @amount,
        converted_amount: converted_amount,
        exchange_rate: rate
      }
    else
      { error: data["error-type"] }
    end
  end
end
