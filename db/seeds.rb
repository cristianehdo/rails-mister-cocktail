require "open-uri"
require "json"

puts 'Cleaning database...'
Ingredient.destroy_all

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
file = open(url)
ingredients = JSON.parse(file)
ingredients.each do |i|
  Ingredient.create!(name: i["strIngredient1"])
  puts "#{i["strIngredient1"]} added to database"
end
