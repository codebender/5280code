class Api::Bitcoin::TickersController < ApplicationController
  respond_to :json

  def show
    respond_with(::Bitstamp.ticker)
  end
end
