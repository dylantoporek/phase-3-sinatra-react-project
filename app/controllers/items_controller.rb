class ItemsController < ApplicationController
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
end