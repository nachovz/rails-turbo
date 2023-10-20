# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
quote1 = Quote.create(name: "The best preparation for tomorrow is doing your best today.")
quote2 = Quote.create(name: "The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.")
quote3 = Quote.create(name: "Keep your face always toward the sunshine - and shadows will fall behind you.")
# create 7 quotes
7.times do
	Quote.create(name: Faker::Quote.famous_last_words)
end

category1 = Category.create(name: "Short")
quote1.categories << category1

quote1.categories.create(name: "Motivational")

category2 = Category.create(name: "Inspirational")
quote2.categories << category2

category3 = Category.create(name: "Long")
quote2.categories << category3

quote3.categories << category2