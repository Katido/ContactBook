# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Client.delete_all()
Account.delete_all()


account = Account.new(username: 'admin', password: '123456')
account.save!()

client = Client.new(name: 'myapplication',account: account, website: "ContactBook", redirect_uri: "#" )
client.save!()
