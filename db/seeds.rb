User.create(name: 'Nathalia Linda', email: 'nathalia@teste.com', password: '123456', password_confirmation: "123456")
User.create(name: 'Carna Val', email: 'carnaval@teste.com', password: '123456', password_confirmation: "123456")

@response = Faraday.get 'https://jsonplaceholder.typicode.com/posts'
post_data = JSON.parse(@response.body)

user = User.all.last
post_data.each do |post|
  Post.create!(
    content: post['body'],
    user_id: user.id
  )
end
