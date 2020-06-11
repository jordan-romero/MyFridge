u = User.create(name: "Jordan", username: "Jordles", email: "jordles@gmail.com", password: "1234")

i = Item.create(name: "apple", expy_date: "6-11-20")
i2 = Item.create(name: "banana", expy_date: "6-12-20")
i3 = Item.create(name: "ketchup", expy_date: "7-8-22")
f = Fridge.create(user: u)
l = List.create(user: u)


