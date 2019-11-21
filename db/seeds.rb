# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Doorkeeper::Application.create!(
  name: 'Test App',
  uid: 'c0896b73c91687cf349606978cab3d2d614c8e1d52d5aa298c754e4b0',
  secret: '303401b3363040a0a747689d2b316c813e1abbe021b29878fc48c432e6861d09c4d',
  redirect_uri: 'urn:ietf:wg:oauth:2.0:oob',
)