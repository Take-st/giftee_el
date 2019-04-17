10000.times do |n|
  name = Faker::JapaneseMedia::DragonBall.character
  status = "WIP"
  deadline_at = "2019-05-30"
  Task.create!(name: name,
               status: status,
               deadline_at: deadline_at,
               )
end