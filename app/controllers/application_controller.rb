class ApplicationController < Sinatra::Base
    # add routes
  set :default_content_type, 'application/json'

  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    # look up the game in the database using its ID
    bakeries = Bakery.find params[:id]
    # send a JSON-formatted response of the game data
    bakeries.to_json include: :baked_goods
  end

  get '/baked_goods/by_price' do
    #sort itemd in database by price
    baked_goods = BakedGood.all.order price: :desc
    #return as json
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.all.order price: :desc
    baked_goods.first.to_json
  end
end
