class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.joins([:user, :item]).
                          order(:id).
                          preload([:user, :item]).
                          page(params[:page]).
                          per_page(50)
  end
end
