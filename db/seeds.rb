# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.create(name: 'Yahoo', url: 'http://www.yahoo.co.jp/', address: '東京都港区赤坂9-7-1 ミッドタウン・タワー')
Company.create(name: 'Google', url: 'https://www.google.co.jp/', address: '東京都港区六本木 6-10-1')
Company.create(name: 'Microsoft', url: 'https://www.microsoft.com/ja-jp/default.aspx', address: '東京都港区港南 2-16-3 品川グランドセントラルタワー')

100.times do |index|
  Customer.create(
    family_name: Faker::Japanese::Name.last_name,
    given_name: Faker::Japanese::Name.first_name,
    email: "customer_#{index}@sparta.com",
    company_id: rand(3) + 1
  )
end

