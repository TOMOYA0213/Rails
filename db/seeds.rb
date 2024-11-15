# ユーザー
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# マイクロポスト
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence      ##############(5)を削除すると解決。
  users.each { |user| user.microposts.create!(content: content) }
end

# リレーションシップ
users = User.all #ユーザー1が、
user  = users.first
following = users[2..50] #3〜51をフォローする。
followers = users[3..40] #4〜41にフォローされる。
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
