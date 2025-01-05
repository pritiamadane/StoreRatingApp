admin_user = User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.name = 'Admin User'
  user.address = '123 Admin St, Admin City, Admin State'
  user.password = 'Admin@123' # Ensure this meets your password requirements
  user.role = 'admin'
end

normal_users = [
  { name: 'John Doe', email: 'john@example.com', address: '456 User St, User City, User State', password: 'User @123' },
  { name: 'Jane Smith', email: 'jane@example.com', address: '789 User St, User City, User State', password: 'User @123' }
]

normal_users.each do |user_data|
  User.find_or_create_by!(email: user_data[:email]) do |user|
    user.name = user_data[:name]
    user.address = user_data[:address]
    user.password = user_data[:password]
    user.role = 'normal_user'
  end
end

store_owners = [
  { name: 'Alice StoreOwner', email: 'alice@store.com', address: '101 Store St, Store City, Store State', password: 'Store@123' },
  { name: 'Bob StoreOwner', email: 'bob@store.com', address: '202 Store St, Store City, Store State', password: 'Store@123' }
]

store_owners.each do |owner_data|
  User.find_or_create_by!(email: owner_data[:email]) do |user|
    user.name = owner_data[:name]
    user.address = owner_data[:address]
    user.password = owner_data[:password]
    user.role = 'store_owner'
  end
end

stores = [
  { name: 'Best Electronics', address: '303 Electronics Ave, Tech City, Tech State', owner: User.find_by(email: 'alice@store.com') },
  { name: 'Gourmet Groceries', address: '404 Grocery Blvd, Food City, Food State', owner: User.find_by(email: 'bob@store.com') }
]

stores.each do |store_data|
  Store.find_or_create_by!(name: store_data[:name]) do |store|
    store.address = store_data[:address]
    store.owner = store_data[:owner]
  end
end

ratings = [
  { user: User.find_by(email: 'john@example.com'), store: Store.find_by(name: 'Best Electronics'), rating: 5 },
  { user: User.find_by(email: 'jane@example.com'), store: Store.find_by(name: 'Gourmet Groceries'), rating: 4 }
]

ratings.each do |rating_data|
  Rating.find_or_create_by!(user: rating_data[:user], store: rating_data[:store]) do |rating|
    rating.rating = rating_data[:rating]
  end
end

puts "Database seeded successfully!"