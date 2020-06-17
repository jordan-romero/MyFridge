u = User.create(name: "Jordles", username: "Jordles", email: "jordles@gmail.com", password: "Jordles")
u2 = User.create(name: "Jo", username: "Jo", email: "jo@gmail.com", password: "Jo")

i = Item.create(name: "apple", expy_date: "6-11-20")
i2 = Item.create(name: "banana", expy_date: "6-12-20")
i3 = Item.create(name: "ketchup", expy_date: "7-8-22")
i4 = Item.create(name: "mustard", expy_date: "7-9-22")
f = Fridge.create(user: u)
l = List.create(user: u)

f.items << i 
f.items << i2
l.items << i3
l.items << i4 