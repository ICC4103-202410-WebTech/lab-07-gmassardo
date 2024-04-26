# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.delete_all
User.delete_all
Tag.delete_all

# db/seeds.rb

# Creamos un arreglo de nombres de usuario y títulos de publicaciones aleatorios
user_names = ["Juan Perez", "Maria Lira", "John Doe", "Luis Ramos", "Paula Soto"]
post_titles = ["Tengo Hambre", "Compro Auto", "Como hacer lasaña", "Top 5 Jere Klein", "Naranjas con jalea", 
                "Tengo sueño", "Taylor Swift Album", "Vendo Ipad", "Pie de Limon Receta", "Concierto Kanye"]
tag_titles = ["Food", "Music", "Market", "Mood", "Sports"]

users = [
  User.create( name: "Juan Perez",
    email: "jperez@example.com",
    password: "12345677"
  ),

  User.create( name: "Maria Lira",
    email: "mlira@example.com",
    password: "12345677"
  ),

  User.create( name: "John Doe",
    email: "jdoe@example.com",
    password: "12345677"
  ),

  User.create( name: "Luis Ramos",
    email: "lramos@example.com",
    password: "12345677"
  ),

  User.create( name: "Paula Soto",
    email: "psoto@example.com",
    password: "12345677"
  )
]

post_titles.each do |title|
    user = User.order(Arel.sql("RANDOM()")).first
    Post.create(
      title: title,
      content: "Content",
      likes_count: rand(100),
      answers_count: rand(50),
      user_id: user.id
    )
  end
# Creamos 5 etiquetas con nombres aleatorios
tag_titles.each do |title|
  Tag.create(name: title)
end


post = Post.find_by(title: "Pie de Limon Receta")
tag = Tag.find_by(name: "Food")

PostTag.create( post_id: post, tag_id: tag)


puts "Users:"
User.all.each do |user|
  puts "ID: #{user.id}, Nombre: #{user.name}, Email: #{user.email}"
end

puts "\Posts:"
Post.all.each do |post|
  puts "ID: #{post.id}, Título: #{post.title}, Contenido: #{post.content}, Likes: #{post.likes_count}, Respuestas: #{post.answers_count}, Usuario ID: #{post.user_id}"
end

# Imprimir el contenido de la tabla Tag
puts "\Tags:"
Tag.all.each do |tag|
  puts "ID: #{tag.id}, Nombre: #{tag.name}"
end

puts "\Post Tags:"
PostTag.all.each do |pt|
    puts pt 
end