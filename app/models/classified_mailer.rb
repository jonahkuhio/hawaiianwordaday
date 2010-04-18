class ClassifiedMailer < ActionMailer::Base

  def word_from_friend(email, word, sent_at=Time.now)
    @subject    = 'A Friend Sent You a Hawaiian Word of the Day'
    @recipients = email
    @from       = 'no-reply@yourdomain.com'
    @sent_on    = sent_at
    @body["term"] = word.term
    @body["definition"] = word.definition
    @body["word_in_context"] = word.word_in_context
    @body["word"] = word
  end

  def word_with_attachment(email_subscription, word, sent_at = Time.now)
    @subject    = 'Hawaiian Word of the Day'
    @recipients = email_subscription.email
    @from       = 'no-reply@yourdomain.com'
    @sent_on    = sent_at
    @body["term"] = word.term
    @body["definition"] = word.definition
    @body["word_in_context"] = word.word_in_context
    @body["word"] = word
    @body[:email_subscription] = email_subscription
    # unless classified.picture.blank?
    #       attachment :body => classified.picture, :content_type => classified.content_type
      
  end

end
