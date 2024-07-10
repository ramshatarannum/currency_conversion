class CurrencyConversionsController < ApplicationController
	def create
    conversion_service = CurrencyConversionService.new(
      params[:original_currency],
      params[:target_currency],
      params[:amount].to_f
    )

    result = conversion_service.call

    if result[:error]
      render json: { error: result[:error] }, status: :bad_request
    else
      conversion = CurrencyConversion.create(result)
      render json: conversion, status: :created
    end
  end

  def index
    conversions = CurrencyConversion.all
    render json: conversions
  end
end
