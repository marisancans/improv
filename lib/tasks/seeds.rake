namespace :seed do
  desc "Seed db"
  task :events => :environment do
    10.times do |event|
      name = Faker::Lorem.sentence(3)
      start_time = Faker::Time.between(DateTime.current.beginning_of_month, DateTime.current + 1.month)
      event = Event.create(name: name, start_time: start_time, color: Event::COLORS.sample, user_id: User.first.id)
      event.save
      puts "[#{event.id}] #{start_time} #{name}"
    end
  end
  
  task :lists => :environment do
    5.times do |list|
      title = Faker::Lorem.sentence
      list = List.create(title: title, user_id: User.first.id)
      list.save
      puts "[#{list.id}] #{list.title}"
      5.times do |list_item|
        content = Faker::Lorem.sentence(3)
        list.list_items.create(content: content) 
      end
    end
  end
  
end
