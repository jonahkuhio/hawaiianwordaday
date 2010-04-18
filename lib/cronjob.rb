class Cronjob
  def self.execute
    puts "loading word of day"
    unused_word = UnusedWord.first
    if unused_word
      puts "creating new word of the day from unused words"
      word = Word.create!(
        :term => unused_word.word,
        :definition => unused_word.definition,
        :word_in_context => unused_word.word_in_context
      )
      unused_word.destroy

      # send word a day email
      puts "sending word a day email"
      EmailSubscription.all.each do |email_subscription|
        email_subscription.update_attribute(:token, ActiveSupport::SecureRandom.hex(10)) unless email_subscription.token
        ClassifiedMailer.deliver_word_with_attachment(email_subscription, word)
      end
    else
      puts "there were no unused words left. whoops."
    end
  end
end
