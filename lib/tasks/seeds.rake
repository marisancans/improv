namespace :seed do
  desc "Seed db"
  task :events => :environment do
    10.times do |event|
      name = Faker::Lorem.sentence(3)
      start_time = Faker::Time.between(DateTime.current.beginning_of_month, DateTime.current + 1.month)
      event = Event.create(name: name, start_time: start_time, user_id: User.first.id)
      event.save
      puts "[#{event.id}] #{start_time} #{name}"
    end
  end
end
