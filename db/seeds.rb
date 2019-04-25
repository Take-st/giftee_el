10.times do |n|
  name = Faker::JapaneseMedia::DragonBall.character
  priority = '高'
  status = "WIP"
  deadline_at = "2019-05-30"
  Task.create!(name: name,
               priority: priority,
               status: status,
               deadline_at: deadline_at,
               )
end

10.times do |n|
  name = Faker::JapaneseMedia::DragonBall.character
  priority = '中'
  status = "WIP"
  deadline_at = "2019-05-30"
  Task.create!(name: name,
               priority: priority,
               status: status,
               deadline_at: deadline_at,
               )
end
10.times do |n|
  name = Faker::JapaneseMedia::DragonBall.character
  priority = '低'
  status = "WIP"
  deadline_at = "2019-05-30"
  Task.create!(name: name,
               priority: priority,
               status: status,
               deadline_at: deadline_at,
               )
end



10.times do |n|
  name = Faker::Games::Pokemon.name
  priority = '高'
  status = "New"
  deadline_at = "2019-05-30"
  Task.create!(name: name,
               priority: priority,
               status: status,
               deadline_at: deadline_at,
               )
end

10.times do |n|
  name = Faker::Games::Pokemon.name
  priority = '中'
  status = "New"
  deadline_at = "2019-05-30"
  Task.create!(name: name,
               priority: priority,
               status: status,
               deadline_at: deadline_at,
               )
end
10.times do |n|
  name = Faker::Games::Pokemon.name
  priority = '低'
  status = "New"
  deadline_at = "2019-05-30"
  Task.create!(name: name,
               priority: priority,
               status: status,
               deadline_at: deadline_at,
               )
end




10.times do |n|
  name = Faker::Games::SuperSmashBros.fighter
  priority = '高'
  status = "Done"
  deadline_at = "2019-05-30"
  Task.create!(name: name,
               priority: priority,
               status: status,
               deadline_at: deadline_at,
               )
end

10.times do |n|
  name = Faker::Games::SuperSmashBros.fighter
  priority = '中'
  status = "Done"
  deadline_at = "2019-05-30"
  Task.create!(name: name,
               priority: priority,
               status: status,
               deadline_at: deadline_at,
               )
end
10.times do |n|
  name = Faker::Games::SuperSmashBros.fighter
  priority = '低'
  status = "Done"
  deadline_at = "2019-05-30"
  Task.create!(name: name,
               priority: priority,
               status: status,
               deadline_at: deadline_at,
               )
end