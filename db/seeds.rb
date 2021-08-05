# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "a@a",
  password: "aaaaaa"
)

Genre.create!(
  [{name: "ケーキ"}, {name: "お菓子"}, {name: "アイス"}]
)

Item.create!(
  [
    {
      genre_id: 1,
      name: 'チョコケーキ',
      introdution: 'チョコが美味しい季節ですね',
      image_id: '',
      price: '1000',
      is_sale: 'true',
    },
    {
      genre_id: 2,
      name: 'クッキー',
      introdution: '美味しく焼けたよ',
      image_id: '',
      price: '100',
      is_sale: 'true',
    },
    {
      genre_id: 3,
      name: 'チョコミント',
      introdution: 'チョコミントは嫌いですか？',
      image_id: '',
      price: '1800',
      is_sale: 'true',
    },
  ]
)