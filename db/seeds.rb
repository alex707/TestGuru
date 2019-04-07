# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = []
[
  { name: 'Arnold', email: 'a@a.a',       password: 'aaaaaa' },
  { name: 'Ben',    email: 'b@b.b',       password: 'bbbbbb' },
].each do |attrs|
  users << User.find_or_create_by(email: attrs[:email]) do |u|
    u.password = attrs[:password]
    u.name = attrs[:name]
    u.skip_confirmation!
    u.save!
  end
end

attrs = {
  name: 'God',
  email: 'servant.main@gmail.com',
  password: 'godgod',
  first_name: 'god',
  last_name: 'god'
}
users << Admin.find_or_create_by(email: attrs[:email]) do |a|
  a.password = attrs[:password]
  a.name = attrs[:name]
  a.first_name = attrs[:first_name]
  a.last_name = attrs[:last_name]
  a.skip_confirmation!
  a.save!
end

cats = []
[
  { title: 'Math' },
  { title: 'Bio' },
  { title: 'Chim' }
].each do |attrs|
  cats << Category.find_or_create_by(attrs)
end

tests = []
[
  { title: 'кладезь мудрости', level: 1, category: cats[1], author: users.last },
  { title: 'великие изыскания', level: 5, category: cats.last, author: users.last }
].each do |t|
  tests << Test.find_or_create_by(t)
end

surveys = []
[
  { user: users.first, test: tests.first },
  { user: users[1], test: tests.last }
].each do |s|
  surveys << Survey.find_or_create_by(s)
end

quests = []
[
  { body: 'в чём сила?', test: tests.first },
  { body: 'кто виноват?', test: tests.first },
  { body: 'как достать соседа?', test: tests.first },
  { body: 'быть или не быть?', test: tests.last },
  { body: 'когда наступит завтра?', test: tests.last }
].each do |q|
  quests << Question.find_or_create_by(q)
end

answers = []
[
  { body: 'всё будет coca-cola', correct: true, question: quests.first },
  { body: 'бери от жизни всё', correct: false, question: quests.first },
  { body: 'мир не прост', correct: true, question: quests[1] },
  { body: 'совсем не прост', correct: false, question: quests[1] },
  { body: 'yellow submorine', correct: true, question: quests[2] },
  { body: 'o darling!', correct: false, question: quests[2] },
  { body: 'палка о двух концах', correct: true, question: quests[3] },
  { body: 'сколь верёвочка не вейся, всё равно совьётся в плеть', correct: false, question: quests[3] },
  { body: 'я ломал стекло', correct: true, question: quests[4] },
  { body: 'дверь мне запили', correct: false, question: quests[4] },
  { body: 'один в поле не воин', correct: true, question: quests[4] },
  { body: 'rm -rf', correct: false, question: quests[4] },
].each do |a|
  answers << Answer.find_or_create_by(a)
end
