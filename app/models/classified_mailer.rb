class ClassifiedMailer < ActionMailer::Base

  def classified_with_attachment(email, classified, url, sent_at = Time.now)
    @subject    = 'Someone thought this word might be of interest to you'
    @recipients = email
    @from       = 'no-reply@yourdomain.com'
    @sent_on    = sent_at
    @body["title"]       = classified.title 
    @body["location"]       = classified.location
    @body["description"] = classified.description
    @body["url"]       = url 
    # unless classified.picture.blank?
    #       attachment :body => classified.picture, :content_type => classified.content_type
      
  end

  def word_with_attachment(email, classified, url, sent_at = Time.now)
    @subject    = 'Hawaiian Word of the Day'
    @recipients = email
    @from       = 'no-reply@yourdomain.com'
    @sent_on    = sent_at
    @body["word"]       = classified.title 
    @body["location"]       = classified.location
    @body["definition"] = classified.description
    @body["url"]       = url 
    # unless classified.picture.blank?
    #       attachment :body => classified.picture, :content_type => classified.content_type
      
  end

end
