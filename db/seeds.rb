3.times {User.create!(username: Faker::Superhero.name, password: "test")}

5.times {Question.create!(subject: Faker::Hipster.word, body: Faker::Hipster.sentence + "?", user_id: rand(1..3))}

10.times {Answer.create!(text: Faker::Hipster.sentence, question_id: rand(1..5), user_id: rand(1..3))}

