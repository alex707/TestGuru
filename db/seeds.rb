# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  { name: 'Arnold', email: 'aa@aa.aa' },
  { name: 'Ben', email: 'bb@bb.bb'}
])

cats = Category.create!([
  { title: 'Math' },
  { title: 'Bio' },
  { title: 'Chim' }
])

tests = Test.create!([
  { title: 'кладезь мудрости', level: 30, category_id: cats[1].id },
  { title: 'великие изыскания', level: 60, category_id: cats.last.id }
])

surveys = Survey.create!([
  { user_id: users.first.id, test_id: tests.first.id },
  { user_id: users.last.id, test_id: tests.last.id }
])

quests = Question.create!([
  { body: 'в чём сила?', test_id: tests.first.id },
  { body: 'кто виноват?', test_id: tests.first.id },
  { body: 'как достать соседа?', test_id: tests.first.id },
  { body: 'быть или не быть?', test_id: tests.last.id },
  { body: 'когда наступит завтра?', test_id: tests.last.id }
])

answers = Answer.create!([
  { body: 'всё будет coca-cola', correct: true, question_id: quests.first.id },
  { body: 'мир не прост', correct: true, question_id: quests[1].id },
  { body: 'yellow submorine', correct: true, question_id: quests[2].id },
  { body: 'палка о двух концах', correct: true, question_id: quests[3].id },
  { body: 'я ломал стекло', correct: true, question_id: quests[4].id },
  { body: 'один в поле не воин', correct: true, question_id: quests[4].id },
  { body: 'rm -rf', correct: false, question_id: quests[4].id },
])
