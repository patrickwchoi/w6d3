# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('artworks')
ActiveRecord::Base.connection.reset_pk_sequence!('artwork_shares')
ActiveRecord::Base.connection.reset_pk_sequence!('comments')


darren = User.create!(username: "awesome_person")
patrick = User.create!(username: "patrickchoi")

monalisa = Artwork.create!(title: 'Mona Lisa', image_url: 'www.mona.com', artist_id: 1)
girl_with_pearl = Artwork.create!(title: 'Girl with the Pearl Earrings', image_url: 'www.pearl.com', artist_id: 1)
cats = Artwork.create!(title: 'My Cat', image_url: 'www.cat.com', artist_id: 2)

ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
ArtworkShare.create!(artwork_id: 3, viewer_id: 1)

Comment.create!(body: "great art!", author_id: 2, artwork_id: 2)
Comment.create!(body: "bad art", author_id: 1, artwork_id: 3)