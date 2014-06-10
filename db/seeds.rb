# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Card.delete_all

Card.create!([
  {id: 1, poster_comment: "This is my first post", url: 'http://blog.docker.com/2014/06/its-here-docker-1-0/', category: 'development' },
  {id: 2, poster_comment: "This is my second post", url: 'http://justinmezzell.com/blog/2014/6/9/design-isnt-doomed', category: 'design'},
  {id: 3, poster_comment: "This is my third post", url: 'http://timesofindia.indiatimes.com/business/india-business/Indian-economy-grew-at-4-7-in-2013-14/articleshow/35794651.cms?', category: 'growth'},
  {id: 4, poster_comment: "This is my fourth post", url: 'http://mattermark.com/phil-carter-patricia-nakache-of-trinity-ventures-show-how-mobile-commerce-will-yield-the-next-100b-startup/', category: 'business'},
  {id: 5, poster_comment: "This is my fifth post", url: 'http://japgolly.blogspot.com.au/2014/06/a-year-of-functional-programming.html', category: 'development'}
])
