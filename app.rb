require 'sinatra'
require_relative 'pizza_price.rb'

get '/' do
  ingredients_array = params[:ingredients_array] if params[:ingredients_array]
  ingredients_array = "" if !params[:ingredients_array]
  erb :home, locals: {ingredients_array: ingredients_array}
end

post '/start_order' do
  ingredients_array = params[:ingredients_array]
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
  redirect '/finalize?pizza_size=' + pizza_size + '&pizza_meat=' + pizza_meat + '&pizza_cheese=' + pizza_cheese + '&pizza_veggies=' + pizza_veggies + '&pizza_crust=' + pizza_crust + '&pizza_sauce=' + pizza_sauce + '&ingredients_array=' + ingredients_array
end

get '/finalize' do
  pizza_size = params[:pizza_size]
  ingredients_array = params[:ingredients_array]
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
  ingredients_array = params[:ingredients_array]
  all_ingredients = Array.new
  all_ingredients << pizza_size
  all_ingredients << pizza_meat
  all_ingredients << pizza_cheese
  all_ingredients << pizza_veggies
  all_ingredients << pizza_crust
  all_ingredients << pizza_sauce
  all_ingredients = all_ingredients.reject {|x| x.empty?}
  erb :finalize, locals: {all_ingredients: all_ingredients, ingredients_array: ingredients_array}
end

post '/checkout' do
  all_ingredients = params[:all_ingredients].split(",")
  ingredients_array = params[:ingredients_array]
  if ingredients_array == ''
    ingredients_array = Array.new
  else
    ingredients_array = ingredients_array.split(',')
  end
  all_ingredients.each do |ingredient|
    if (ingredient == "thin_crust") && (params[ingredient.to_sym] == "no")
      ingredients_array << "pan_crust"
    end
    if (ingredient == "bbq" || ingredient == "ranch") && (params[ingredient.to_sym] == "no")
      ingredients_array << "regular_sauce"
    end
    if (ingredient == "3_cheese") && (params[ingredient.to_sym] == "no")
      ingredients_array << "regular_cheese"
    end
    if params[ingredient.to_sym] == "yes" || ingredient == "small" || ingredient == "medium" || ingredient == "large"
      ingredients_array << ingredient
    end
  end
  ingredients_array = ingredients_array.join(",")
  if params[:pickup_delivery] == "new_pizza"
    redirect '/?ingredients_array=' + ingredients_array
  elsif params[:pickup_delivery] == "pickup"
    redirect '/placed?ingredients_array=' + ingredients_array
  else
    redirect '/address?ingredients_array=' + ingredients_array
  end
end

get '/address' do
  ingredients_array = params[:ingredients_array]
  erb :address, locals: {ingredients_array: ingredients_array}
end

post '/address' do
    delivery_location = params[:delivery_location]
    ingredients_array = params[:ingredients_array]
    redirect '/placed?ingredients_array=' + ingredients_array + '&delivery_location=' + delivery_location
  end

get '/placed' do
  ingredients_array = params[:ingredients_array].split(',')
  delivery_location = params[:delivery_location]
  price = pizza_price(ingredients_array.length, ingredients_array)
  erb :placed, locals: {ingredients_array: ingredients_array, delivery_location: delivery_location, price: price}
end
