class StoresController < ApplicationController
    get '/stores' do
        stores = Store.all.order(:name)
        stores.to_json
      end
    
      get'/stores/:id' do
        store = Store.find(params[:id])
        store.to_json(only: [:id, :name, :location], include: {
          stocks: { only: [:id, :quantity, :store_id, :item_id], include: {
            item: { only: [:id, :name, :price] }
          }}
        })
      end
end