# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Film.destroy_all
Category.destroy_all
Actor.destroy_all
Review.destroy_all
Rating.destroy_all

5.times do |x|
  User.create!(first_name: "tom#{x}" , last_name: "rogers#{x}", email:"tom@tom#{x}.com", password:'123456', trusted: [true,false].sample)
end

User.create(first_name: "example" , last_name: "account", email:"example@account.com", password:'password', trusted: true)

User.create(first_name: 'tom', last_name: 'tom', email: 'tom@tom.com', password: 'tomtom', trusted: true)

Category.create!([{title: "Drama"}, {title: "Romance"}, {title:"Action"}, {title:"Fantasy"}, {title:"Animation"}, {title: "Adventure"}, {title: "Family"}, {title:"Horror"}, {title:"Mystery"}, {title:"Thriller"}, {title: "Sci-Fi"}])
Film.create!([{title: "Titanic", video_url: "https://www.youtube.com/embed/zCy5WQ9S4c0"},
  {title: "Akira", video_url: "https://www.youtube.com/embed/7G5zQW4TinQ"},
  {title: "Forrest Gump", video_url: "https://www.youtube.com/embed/uPIEn0M8su0" },
  {title: "The Matrix", video_url: "https://www.youtube.com/embed/m8e-FF8MsqU"},
  {title: "Spirited Away", video_url: "https://www.youtube.com/embed/ByXuk9QqQkk"},
  {title: "Psycho", video_url: "https://www.youtube.com/embed/NG3-GlvKPcg"},
  {title: "Memento", video_url: "https://www.youtube.com/embed/0vS0E9bBSL0"},
  {title: "The Shining", video_url: "https://www.youtube.com/embed/5Cb3ik6zP2I" },
  {title: "Your Name", video_url: "https://www.youtube.com/embed/xU47nhruN-Q"},
  {title: "Old Boy", video_url: "https://www.youtube.com/embed/2HkjrJ6IK5E"}])
Actor.create!([{first_name: "Leonardo", last_name: "DiCaprio"}, {first_name: "Tom", last_name: "Hanks"}, {first_name: "Carrie-Anne", last_name: "Moss"}, {first_name: "Anthony", last_name: "Perkins"}, {first_name: "Janet", last_name: "Leigh"}, {first_name: "Guy", last_name: "Pearce"}, {first_name: "Jack", last_name: "Nicholson"}, {first_name: "Jie-tae", last_name: "Yu"}])
Review.create!([{text: "Great Movie", user: User.first, reviewable: Film.first}, {text:"Hated it!", user: User.second, reviewable: Film.second}, {text:"Just ok", user: User.third, reviewable: Film.third}, {text: "Mind Blown", user: User.first, reviewable: Film.fourth}, {text: "Meh", user: User.first, reviewable: Film.fifth}])

Film.find_by({title: "Titanic"}).categories = [Category.find_by({title: "Drama"}), Category.find_by({title: "Romance"})]
Film.find_by({title: "Titanic"}).actors = [Actor.find_by({first_name: "Leonardo", last_name: "DiCaprio"})]

Film.find_by({title: "Akira"}).categories = [Category.find_by({title: "Animation"}), Category.find_by({title: "Action"}), Category.find_by({title: "Drama"}), Category.find_by({title: "Fantasy"})]

Film.find_by({title: "Forrest Gump"}).categories = [Category.find_by({title: "Drama"}), Category.find_by({title: "Romance"})]
Film.find_by({title: "Forrest Gump"}).actors = [Actor.find_by({first_name: "Tom", last_name: "Hanks"})]

Film.find_by({title: "The Matrix"}).categories = [Category.find_by({title: "Action"}), Category.find_by({title: "Sci-Fi"})]
Film.find_by({title: "The Matrix"}).actors = [Actor.find_by({first_name: "Carrie-Anne", last_name: "Moss"})]

Film.find_by({title: "Spirited Away"}).categories = [Category.find_by({title: "Animation"}), Category.find_by({title: "Adventure"}), Category.find_by({title: "Family"})]

Film.find_by({title: "Psycho"}).categories = [Category.find_by({title: "Horror"}), Category.find_by({title: "Mystery"}), Category.find_by({title: "Thriller"})]
Film.find_by({title: "Psycho"}).actors = [Actor.find_by({first_name: "Anthony", last_name: "Perkins"}), Actor.find_by({first_name: "Janet", last_name: "Leigh"})]

Film.find_by({title: "Memento"}).categories = [Category.find_by({title: "Mystery"}), Category.find_by({title: "Thriller"})]
Film.find_by({title: "Memento"}).actors = [Actor.find_by({first_name: "Carrie-Anne", last_name: "Moss"}), Actor.find_by({first_name: "Guy", last_name: "Pearce"})]

Film.find_by({title: "The Shining"}).categories = [Category.find_by({title: "Drama"}), Category.find_by({title: "Horror"})]
Film.find_by({title: "The Shining"}).actors = [Actor.find_by({first_name: "Jack", last_name: "Nicholson"})]

Film.find_by({title: "Your Name"}).categories = [Category.find_by({title: "Animation"}), Category.find_by({title: "Drama"}), Category.find_by({title: "Romance"})]

Film.find_by({title: "Old Boy"}).categories = [Category.find_by({title: "Action"}), Category.find_by({title: "Drama"}), Category.find_by({title: "Mystery"}), Category.find_by({title: "Thriller"})]
Film.find_by({title: "Old Boy"}).actors = [Actor.find_by({first_name: "Jie-tae", last_name: "Yu"})]

all_films = Film.all

all_users = User.all

all_reviews = Review.all

review_comment_bodies = ["I totally agree!", "No! You're wrong!", "I'm not sure if I agree or not...", "Valid point!", "Dude, did you even watch the movie?", "This review seems like it was picked off an array and isn't specific to this movie!"]

film_comment_bodies = ["My brother worked on this movie!", "This movie changed my life!", "I've never seen this one, is it good?", "Are you kidding me? Why is this movie on the website? I thought it was carefully curated!"]

all_films.each do |film|
  all_users.each do |user|
    film.ratings.create(stars: (Random.rand(5) + 1), user_id: user.id)
  end
  2.times do
    film.comments.create(text: film_comment_bodies.sample, user_id: all_users.sample.id)
  end
end

all_reviews.each do |review|
  all_users.each do |user|
    review.ratings.create(stars: (Random.rand(5) + 1), user_id: user.id)
  end
  2.times do
      review.comments.create(text: review_comment_bodies.sample, user_id: all_users.sample.id)
    end
end
