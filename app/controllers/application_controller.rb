class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/items" do
    items = Item.all.order(:name)
    items.to_json
  end

  get '/items/:id' do
    item = Item.find(params[:id])
    item.to_json(only: [:id, :name, :price], include: {
      stocks: { only: [:quantity], include: {
        store: { only: [:name, :location] }
      }}
    })
  end

  get '/stores' do
    stores = Store.all.order(:name)
    stores.to_json
  end

  get'/stores/:id' do
    store = Store.find(params[:id])
    store.to_json(only: [:id, :name, :location], include: {
      stocks: { only: [:quantity], include: {
        item: { only: [:name, :price] }
      }}
    })
  end

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
    stock.to_json
  end

  delete '/stocks/:id' do
    stock = Stock.find(params[:id])
    stock.destroy
    stock.to_json
  end

end
