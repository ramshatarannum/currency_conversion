# app/services/currency_conversion_service.rb

require 'net/http'
require 'json'

class CurrencyConversionService
  # Base URL for the currency conversion API
  BASE_URL = "https://v6.exchangerate-api.com/v6/#{ENV['FREECURRENCYAPI_API_KEY']}/latest/"

  # Initialize with original currency, target currency, and amount to convert
  def initialize(original_currency, target_currency, amount)
    @original_currency = original_currency
    @target_currency = target_currency
    @amount = amount
  end

  # Perform the currency conversion
  def call
    # Construct the URI for the API request
    uri = URI("#{BASE_URL}#{@original_currency}")
    # Send the GET request to the API
    response = Net::HTTP.get(uri)
    # Parse the JSON response
    data = JSON.parse(response)

    # Check if the API response indicates success
    if data["result"] == "success"
      # Get the conversion rate for the target currency
      rate = data["conversion_rates"][@target_currency]
      # Calculate the converted amount
      converted_amount = @amount * rate

      # Return the conversion details
      { 
        original_currency: @original_currency,
        target_currency: @target_currency,
        original_amount: @amount,
        converted_amount: converted_amount,
        exchange_rate: rate
      }
    else
      # Return an error message if the API response indicates failure
      { error: data["error-type"] }
    end
  end
end