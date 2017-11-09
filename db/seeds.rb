require "json"
require "open-uri"

puts 'Cleaning database...'
Ingredient.destroy_all

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
file = open(url).read
ingredients = JSON.parse(file)
ingredients["drinks"].each do |i|
  ingredient = i['strIngredient1']
  Ingredient.create!(name: ingredient)
  puts "#{ingredient} added to database"
end
