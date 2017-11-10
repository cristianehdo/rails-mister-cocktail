require "json"
require "open-uri"

puts 'Cleaning database...'
Ingredient.destroy_all
Cocktail.destroy_all

puts "Creating ingredients..."

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
file = open(url).read
ingredients = JSON.parse(file)
ingredients["drinks"].each do |i|
  ingredient = i['strIngredient1']
  Ingredient.create!(name: ingredient)
  puts "#{ingredient} added to database"
end

puts "Creating cocktails..."

BASE_URL = "http://res.cloudinary.com/dlyxj5ddk/image/upload/v1510318613/"
COCKTAILS_ATTRIBUTES = [
  {
    "name"=>"Martini",
    "description"=>"If there is one cocktail to divide opinion, it is surely the omnipresent Mojito cocktail. Some say it is a pain in the arse to make, is too frequently made badly, and is the mascot for unadventurous drinkers everywhere.",
    "image_url"=> "https://images.unsplash.com/photo-1438522014717-d7ce32b9bab9?auto=format&fit=crop&w=1349&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D"
  },
  { "name"=>"Mojito",
    "description"=> "Some would argue that the Martini Cocktail is the greatest cocktail of them all and certainly the most iconic. ",
    "image_url"=>"https://images.unsplash.com/photo-1497534446932-c925b458314e?auto=format&fit=crop&w=707&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D"
  },
  { "name"=>"Negroni",
    "description"=>"A firm favourite at Social and Cocktail HQ, made properly, this is the taste of cocktail heaven!",
    "image_url"=> "https://images.unsplash.com/photo-1455621481073-d5bc1c40e3cb?auto=format&fit=crop&w=1483&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D"
  },
  { "name"=>"Mai-tai",
    "description"=>"Like fashion, cocktail culture has its ups and downs. We’ve raunchy-named garish tooth-rotters, and we’ve had the uninspired vodka revolution. It was only a matter of time therefore, that bitterness came back on the menu, and with it, the rise in popularity of its ambassador the Negroni.",
    "image_url"=> "https://images.unsplash.com/photo-1500291161618-747dee2ab16c?auto=format&fit=crop&w=1350&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D"
  }
]
COCKTAILS_ATTRIBUTES.each do |cocktail_attributes|
  c = Cocktail.new(cocktail_attributes.except("image_url"))
  c.remote_image_url = cocktail_attributes["image_url"]
  c.save!
end

puts "Done! :)"
