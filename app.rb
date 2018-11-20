require 'sinatra'

get '/' do
  erb :home
end

post '/start_order' do
  pizza_size = params[:pizza_size]
  pizza_meat_pepperoni = params[:pizza_meat_pepperoni]
  pizza_meat_sausage = params[:pizza_meat_sausage]
  pizza_meat_chicken = params[:pizza_meat_chicken]
  pizza_cheese = params[:pizza_cheese]
  pizza_veggies_mushrooms = params[:pizza_veggies]
  pizza_veggies_peppers = params[:pizza_veggies_peppers]
  pizza_veggies_mushrooms = params[:pizza_veggies_mushrooms]
  pizza_crust = params[:pizza_crust]
  pizza_sauce = params[:pizza_sauce]
  p "Pizza size is #{pizza_size}"
  p "Meats are #{pizza_meat_pepperoni} #{pizza_meat_sausage} #{pizza_meat_chicken}"
end
