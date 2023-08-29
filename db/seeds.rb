# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category1 = Category.create(name: 'Dessert')
category2 = Category.create(name: 'Starter')
category3 = Category.create(name: 'Fast Food')
category4 = Category.create(name: 'Juice')
category5 = Category.create(name: 'Beverages')



item1 = Item.create(title: 'Item 1', description: 'Description for Item 1', price: 10)
item1.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'img-1.jpg')), filename: 'f1.jpg', content_type: 'image/jpeg')
ItemCategory.create(item: item1, category: category1)

item2 = Item.create(title: 'Item 2', description: 'Description for Item 2', price: 15)
item2.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'img-1.jpg')), filename: 'f1.jpg', content_type: 'image/jpeg')
ItemCategory.create(item: item2, category: category2)

item3 = Item.create(title: 'Item 3', description: 'Description for Item 3', price: 20)
item3.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'img-3.jpg')), filename: 'f1.jpg', content_type: 'image/jpeg')
ItemCategory.create(item: item3, category: category3)
item4 = Item.create(title: 'Item 4', description: 'Description for Item 4', price: 25)
item4.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'img-4.jpg')), filename: 'f1.jpg', content_type: 'image/jpeg')
ItemCategory.create(item: item4, category: category4)
item5 = Item.create(title: 'Item 5', description: 'Description for Item 5', price: 30)
item5.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'img-5.jpg')), filename: 'f1.jpg', content_type: 'image/jpeg')
ItemCategory.create(item: item5, category: category5)


item6 = Item.create(title: 'Item 6', description: 'Description for Item 6', price: 60)
item6.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'img-6.jpg')), filename: 'f1.jpg', content_type: 'image/jpeg')
ItemCategory.create(item: item6, category: category1)

item7 = Item.create(title: 'Item 2', description: 'Description for Item 2', price: 15)
item7.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'img-1.jpg')), filename: 'f1.jpg', content_type: 'image/jpeg')
ItemCategory.create(item: item7, category: category1)

item8 = Item.create(title: 'Item 3', description: 'Description for Item 3', price: 20)
item8.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'img-2.jpg')), filename: 'f1.jpg', content_type: 'image/jpeg')
ItemCategory.create(item: item3, category: category1)

user1 = User.create(full_name: 'Rachel Warbelow', email: 'demo+rachel@jumpstartlab.com', password_digest: 'password')
user2 = User.create(full_name: 'Jeff Casimir', email: 'demo+jeff@jumpstartlab.com', password_digest: 'password', display_name: 'j3')
user3 = User.create(full_name: 'Jorge Tellez', email: 'demo+jorge@jumpstartlab.com', password_digest: 'password', display_name: 'novohispano')
user4 = User.create(full_name: 'Josh Cheek', email: 'demo+josh@jumpstartlab.com', password_digest: 'password', role: 1)

