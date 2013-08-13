class CurrenciesController < ApplicationController
  # GET /currencies
  # GET /currencies.xml
  before_filter :authenticate_user!
  def index
    @currencies = Currency.all
    @collected_currencies = 0
    current_user.countries.each do |country|
      @collected_currencies = @collected_currencies +  country.currencies.count
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @currencies }
    end
  end

  # GET /currencies/1
  # GET /currencies/1.xml
  def show
    @currency = Currency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @currency }
    end
  end

end
