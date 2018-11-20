require 'sinatra'

get '/' do
  erb :home
end

post '/start_order' do
  pizza_size = params[:pizza_size]
  if params[:pizza_meat]
    pizza_meat = params[:pizza_meat].join(',')
  else
    pizza_meat = ""
  end
  pizza_cheese = params[:pizza_cheese]
  if params[:pizza_veggies]
    pizza_veggies = params[:pizza_veggies].join(',')
  else
    pizza_veggies = ""
  end
  pizza_crust = params[:pizza_crust]
  pizza_sauce = params[:pizza_sauce]
  redirect '/finalize?pizza_size=' + pizza_size + '&pizza_meat=' + pizza_meat + '&pizza_cheese=' + pizza_cheese + '&pizza_veggies=' + pizza_veggies + '&pizza_crust=' + pizza_crust + '&pizza_sauce=' + pizza_sauce
end

get '/finalize' do
  pizza_size = params[:pizza_size]
  if params[:pizza_meat]
    pizza_meat = params[:pizza_meat].split(",")
  else
    pizza_meat = ""
  end
  pizza_cheese = params[:pizza_cheese]
  if params[:pizza_veggies]
    pizza_veggies = params[:pizza_veggies].split(",")
  else
    pizza_veggies = ""
  end
  pizza_crust = params[:pizza_crust]
  pizza_sauce = params[:pizza_sauce]
  all_ingredients = Array.new
  all_ingredients << pizza_size
  all_ingredients << pizza_meat
  all_ingredients << pizza_cheese
  all_ingredients << pizza_veggies
  erb :finalize, locals: {all_ingredients: all_ingredients}
end
