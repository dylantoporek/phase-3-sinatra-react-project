puts "🌱 Seeding spices..."

Store.create(location: "Kakariko Village", name: "The Curious Quiver")
Store.create(location: "Hateno Village", name: "East Wind")
Store.create(location: "Rito Village", name: "The Slippery Falcon")
Item.create(name: "Arrow", price: 5)
Item.create(name: "Wooden Bow", price: 30)
Item.create(name: "Fire Arrow", price: 10)
Item.create(name: "Apple", price: 1)
Item.create(name: "Tunic", price: 50)
Stock.create(quantity: 10, store_id: 1, item_id: 1)
Stock.create(quantity: 10, store_id: 1, item_id: 3)
Stock.create(quantity: 3, store_id: 1, item_id: 2)
Stock.create(quantity: 10, store_id: 2, item_id: 4)
Stock.create(quantity: 10, store_id: 2, item_id: 1)
Stock.create(quantity: 2, store_id: 3, item_id: 5)
Stock.create(quantity: 10, store_id: 3, item_id: 3)
Stock.create(quantity: 10, store_id: 3, item_id: 4)



puts "✅ Done seeding!"
