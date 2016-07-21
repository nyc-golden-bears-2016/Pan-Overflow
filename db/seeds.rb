3.times {User.create!(username: Faker::Superhero.name, password: "test")}

5.times {Question.create!(subject: Faker::Hipster.word, body: Faker::Hipster.sentence + "?", user_id: User.all.sample.id)}

4.times {Tag.create!(name: Faker::Hipster.word)}

Question.all.each do |question|
  question.tags << Tag.all.sample
end

10.times {Answer.create!(body: Faker::Hipster.sentence, question_id: rand(1..5), user_id: User.all.sample.id)}

5.times {Comment.create!(body: Faker::Hipster.sentence, commentable_type: "Question", commentable_id: rand(1..3), user_id: User.all.sample.id)}

5.times {Comment.create!(body: Faker::Hipster.sentence, commentable_type: "Answer", commentable_id: rand(1..10), user_id: User.all.sample.id)}
