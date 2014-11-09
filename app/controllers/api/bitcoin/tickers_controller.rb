class Api::Bitcoin::TickersController< Api::BaseController
  
  def show
    respond_with(::Bitstamp.ticker)
  end
end
