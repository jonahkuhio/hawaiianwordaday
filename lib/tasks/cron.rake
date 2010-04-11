desc "Execute with a cron job"
task :cron => :environment do
  puts "loading word of day"
  unused_word = UnusedWord.first
  if unused_word
    puts "creating new word of the day from unused words"
    word = Classified.create!(
      :title => unused_word.word,
      :location => "Honolulu",
      :description => unused_word.definition
    )
    unused_word.destroy
  
    # send word a day email
    puts "sending word a day email"
    url = "http://localhost:3000/classified/#{word.id}"
    EmailSubscription.all.each do |email_subscription|
      ClassifiedMailer.deliver_word_with_attachment(email_subscription.email, word, url)
    end
  else
    puts "there were no unused words left. whoops."
  end
end