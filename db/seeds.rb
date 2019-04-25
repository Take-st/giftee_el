1.times do |n|
  name = Faker::JapaneseMedia::DragonBall.character
  # email = "a#{n}.com"
  email = "admin.com"
  password = "11111111"
  password_confirmation = "11111111"
  User.create!( name: name,
                email: email,
                password: password,
                password_confirmation: password_confirmation,
                admin: true,
                )
end

# 10.times do |n|
#   user = User.find(11)
#   name = Faker::JapaneseMedia::DragonBall.character
#   priority = '高'
#   status = "WIP"
#   deadline_at = "2019-05-30"
#   user.tasks.create!(name: name,
#                     priority: priority,
#                     status: status,
#                     deadline_at: deadline_at,
#                     )
# end

# 10.times do |n|
#   name = Faker::JapaneseMedia::DragonBall.character
#   priority = '高'
#   status = "WIP"
#   deadline_at = "2019-05-30"
#   Task.create!(name: name,
#                priority: priority,
#                status: status,
#                deadline_at: deadline_at,
#                )
# end

# 10.times do |n|
#   name = Faker::JapaneseMedia::DragonBall.character
#   priority = '中'
#   status = "WIP"
#   deadline_at = "2019-05-30"
#   Task.create!(name: name,
#                priority: priority,
#                status: status,
#                deadline_at: deadline_at,
#                )
# end
# 10.times do |n|
#   name = Faker::JapaneseMedia::DragonBall.character
#   priority = '低'
#   status = "WIP"
#   deadline_at = "2019-05-30"
#   Task.create!(name: name,
#                priority: priority,
#                status: status,
#                deadline_at: deadline_at,
#                )
# end



# 10.times do |n|
#   name = Faker::Games::Pokemon.name
#   priority = '高'
#   status = "New"
#   deadline_at = "2019-05-30"
#   Task.create!(name: name,
#                priority: priority,
#                status: status,
#                deadline_at: deadline_at,
#                )
# end

# 10.times do |n|
#   name = Faker::Games::Pokemon.name
#   priority = '中'
#   status = "New"
#   deadline_at = "2019-05-30"
#   Task.create!(name: name,
#                priority: priority,
#                status: status,
#                deadline_at: deadline_at,
#                )
# end
# 10.times do |n|
#   name = Faker::Games::Pokemon.name
#   priority = '低'
#   status = "New"
#   deadline_at = "2019-05-30"
#   Task.create!(name: name,
#                priority: priority,
#                status: status,
#                deadline_at: deadline_at,
#                )
# end




# 10.times do |n|
#   name = Faker::Games::SuperSmashBros.fighter
#   priority = '高'
#   status = "Done"
#   deadline_at = "2019-05-30"
#   Task.create!(name: name,
#                priority: priority,
#                status: status,
#                deadline_at: deadline_at,
#                )
# end

# 10.times do |n|
#   name = Faker::Games::SuperSmashBros.fighter
#   priority = '中'
#   status = "Done"
#   deadline_at = "2019-05-30"
#   Task.create!(name: name,
#                priority: priority,
#                status: status,
#                deadline_at: deadline_at,
#                )
# end
# 10.times do |n|
#   name = Faker::Games::SuperSmashBros.fighter
#   priority = '低'
#   status = "Done"
#   deadline_at = "2019-05-30"
#   Task.create!(name: name,
#                priority: priority,
#                status: status,
#                deadline_at: deadline_at,
#                )
# end