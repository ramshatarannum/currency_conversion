# app/controllers/currency_conversions_controller.rb

class CurrencyConversionsController < ApplicationController
  # POST /currency_conversions
  def create
    # Initialize the conversion service with the provided parameters
    conversion_service = CurrencyConversionService.new(
      params[:original_currency],
      params[:target_currency],
      params[:amount].to_f
    )

    # Call the service to perform the conversion
    result = conversion_service.call

    # Check for errors in the conversion result
    if result[:error]
      # Return an error response if conversion failed
      render json: { error: result[:error] }, status: :bad_request
    else
      # Create a new CurrencyConversion record if conversion succeeded
      conversion = CurrencyConversion.create(result)
      # Return the created record as a JSON response
      render json: conversion, status: :created
    end
  end

  # GET /currency_conversions
  def index
    # Retrieve all currency conversion records
    conversions = CurrencyConversion.all
    # Return the records as a JSON response
    render json: conversions
  end
end
