namespace :pg do
  desc "Run pg server"
  task :start => :environment do
    system 'sudo service postgresql start'
  end
  desc "Run pg server"
  task :stop => :environment do
    system 'sudo service postgresql stop'
  end

end
