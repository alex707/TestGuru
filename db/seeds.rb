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
].map do |attrs|
  User.find_or_create_by(email: attrs[:email]) do |u|
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

cats = [
  { title: 'Math' },
  { title: 'Bio' },
  { title: 'Chim' },
  { title: 'Backend' }
].map do |attrs|
  Category.find_or_create_by(attrs)
end

tests = [
  { title: 'Живое/неживое', level: 1, category: cats[1], author: users.last },
  { title: 'Жидкое/нежидкое', level: 5, category: cats[2], author: users.last },
  { title: 'Ruby', level: 5, category: cats[3], author: users.last },
  { title: 'Python', level: 5, category: cats[3], author: users.last },
  { title: 'C++', level: 4, category: cats[3], author: users.last },
].map do |t|
  Test.find_or_create_by(t)
end

quests = [
  { body: 'Моря', test: tests[0] },
  { body: 'Горы', test: tests[0] },
  { body: 'Равнины', test: tests[0] },
  { body: 'Погода', test: tests[1] },
  { body: 'Запчасти', test: tests[1] },
  { body: 'Ruby похож на...', test: tests[2] },
  { body: 'Ruby не похож на...', test: tests[2] },
  { body: 'Python похож на...', test: tests[3] },
  { body: 'Python не похож на...', test: tests[3] },
  { body: 'C++ похож на...', test: tests[4] },
  { body: 'C++ не похож на...', test: tests[4] },
].map do |q|
  Question.find_or_create_by(q)
end

answers = [
  { body: 'Краб', correct: true, question: quests[0] },
  { body: 'Камень', correct: false, question: quests[0] },
  { body: 'Птица', correct: true, question: quests[1] },
  { body: 'Камень', correct: false, question: quests[1] },
  { body: 'Волк', correct: true, question: quests[2] },
  { body: 'Камень', correct: false, question: quests[2] },
  { body: 'Дождь', correct: true, question: quests[3] },
  { body: 'Ветер', correct: false, question: quests[3] },
  { body: 'Термопаста', correct: true, question: quests[4] },
  { body: 'Вентилятор', correct: false, question: quests[4] },
  { body: 'Asm', correct: false, question: quests[5] },
  { body: 'Python', correct: true, question: quests[5] },
  { body: 'Asm', correct: true, question: quests[6] },
  { body: 'Python', correct: false, question: quests[6] },
  { body: 'Asm', correct: false, question: quests[7] },
  { body: 'Ruby', correct: true, question: quests[7] },
  { body: 'Asm', correct: true, question: quests[8] },
  { body: 'Ruby', correct: false, question: quests[8] },
  { body: 'SQL', correct: false, question: quests[9] },
  { body: 'C', correct: true, question: quests[9] },
  { body: 'SQL', correct: true, question: quests[10] },
  { body: 'C', correct: false, question: quests[10] },
].map do |a|
  Answer.find_or_create_by(a)
end

badges = [
  { name: 'Гуру Бэкэнда', icon: 'badge-0.jpg', description: 'За успешное прохождение темы "Backend"', param: {category: cats[3].id}.to_json },
  { name: 'Баловень судьбы', icon: 'badge-1.jpg', description: 'За успешное прохождение теста c первой попытки', param: {count: 1}.to_json },
  { name: 'Гуру Уровня 4', icon: 'badge-2.jpg', description: 'За успешное прохождение всех тестов уровня 4', param: {level: 4}.to_json },
].map do |b|
  Badge.find_or_create_by(b)
end
