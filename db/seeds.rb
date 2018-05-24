# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.destroy_all
Text.destroy_all
Image.destroy_all
tables = ['articles', 'texts', 'images']
auto_inc_val = 1

tables.each do |table|
  ActiveRecord::Base.connection.execute(
    "ALTER SEQUENCE #{table}_id_seq RESTART WITH #{auto_inc_val}"
  )
end

article = Article.create!(title: 'Ruby')
Article.create!(title: 'How to hack facebook')

Text.create!(order: 1, article: article, headline: 'Welcome', sentences: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.')
Text.create!(order: 2, article: article, headline: 'Normal', sentences: ' standard dummy text ever since the 1500s')
Text.create!(order: 3, article: article, headline: 'Medium', sentences: ' when an unknown printer took a galley of type and scrambled it to make a type specimen book.')
Text.create!(order: 4, article: article, headline: 'High', sentences: ' It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ')
Text.create!(order: 5, article: article, headline: 'Above High', sentences: 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,')
Text.create!(order: 6, article: article, headline: 'Hightest', sentences: ' and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')

Image.create!(order: 5.5, article: article, headline: 'light')
Image.create!(order: 1.5, article: article, headline: 'light')
