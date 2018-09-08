# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { name: 'Arnold', email: 'aa@aa.aa' },
  { name: 'Ben', email: 'bb@bb.bb'}
])

cats = Category.create([
  { title: 'Math' },
  { title: 'Bio' },
  { title: 'Chim' }
])

tests = Test.create([
  { title: 'кладезь мудрости', level: 30, category: cats[1] },
  { title: 'великие изыскания', level: 60, category: cats.last }
])

surveys = Survey.create([
  { user: users.first, test: tests.first },
  { user: users.last, test: tests.last }
])

quests = Question.create([
  { body: 'в чём сила?', test: tests.first },
  { body: 'кто виноват?', test: tests.first },
  { body: 'как достать соседа?', test: tests.first },
  { body: 'быть или не быть?', test: tests.last },
  { body: 'когда наступит завтра?', test: tests.last }
])

answers = Answer.create([
  { body: 'всё будет coca-cola', correct: true, question: quests.first },
  { body: 'мир не прост', correct: true, question: quests[1] },
  { body: 'yellow submorine', correct: true, question: quests[2] },
  { body: 'палка о двух концах', correct: true, question: quests[3] },
  { body: 'я ломал стекло', correct: true, question: quests[4] },
  { body: 'один в поле не воин', correct: true, question: quests[4] },
  { body: 'rm -rf', correct: false, question: quests[4] },
])
