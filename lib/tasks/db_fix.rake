namespace :events do
  desc "Fix defaut color"
  task :fix_color => :environment do
    Event.connection
    Event.all.each do |e|
       if e.color.blank? 
            e.color = :blue 
            puts e.id
        end
    end
  end

end
