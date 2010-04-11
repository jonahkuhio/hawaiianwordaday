desc "Execute with a cron job"
task :cron => :environment do
  Cronjob.execute
end