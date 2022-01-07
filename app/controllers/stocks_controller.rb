class StocksController < ApplicationController
    get '/stocks' do
        stocks = Stock.all
        stocks.to_json
      end
    
      post '/stocks' do
        stock = Stock.create(
          quantity: params[:quantity],
          store_id: params[:store_id],
          item_id: params[:item_id]
        )
        stock.to_json
      end
    
      patch '/stocks/:id' do
        stock = Stock.find(params[:id])
        stock.update(
          quantity: params[:quantity]
        )
        stock.to_json(include: {
          item: { only: [:id, :name, :price] }
        })
      end
    
      delete '/stocks/:id' do
        stock = Stock.find(params[:id])
        stock.destroy
        stock.to_json
      end
end