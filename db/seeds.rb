# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Movie.create(name: "Lucy", description: "lorem ipsum", url_imagen: "https://i.pinimg.com/originals/0a/af/63/0aaf63c2b1cd98ef5e10b76c792a8d61.jpg")
Movie.create(name: "Transformers the last knight", description: "lorem ipsum", url_imagen: "https://images-na.ssl-images-amazon.com/images/I/91DaTznc-tL._RI_.jpg")
Movie.create(name: "Ganster Americano", description: "lorem ipsum", url_imagen: "http://www.demasiadocine.com/wp-content/uploads/2014/06/American-Gangster.jpg")
Movie.create(name: "Titanic", description: "lorem ipsum", url_imagen: "https://images-na.ssl-images-amazon.com/images/I/51G13d3EwBL.jpg")
Movie.create(name: "Matrix", description: "lorem ipsum", url_imagen: "http://orig08.deviantart.net/fbe4/f/2009/258/2/f/2fca1bc9ddcc147ef674d2eebb14ee3a.jpg")


Movie.all.each do |movie|
  MovieFunction.create(movie: movie, date: Date.today)
end

