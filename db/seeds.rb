# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create({email: "jules.laurent@blabla.com", password: "password", password_confirmation: "password" })


Message.create([
    {content: "Message 1", user: user},
    {content: "Message 2", user: user},
    {content: "Message 3", user: user},
    {content: "Message 4", user: user},
    {content: "Message 5", user: user}
               ])