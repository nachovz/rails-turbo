# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
quote1 = Quote.create(name: "The best preparation for tomorrow is doing your best today.")
quote2 = Quote.create(name: "The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.")

category1 = Category.create(name: "Motivational", quote_id: quote1.id)
category2 = Category.create(name: "Inspirational", quote_id: quote2.id)
category3 = Category.create(name: "Long", quote_id: quote2.id)