class Word < ActiveRecord::Base
  #validation of records jfv
  belongs_to :category
  belongs_to :user
  validates_presence_of :term
  validates_presence_of :definition
  validates_presence_of :word_in_context
  validates_uniqueness_of :term 
  

  #validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  # cryptic code above is standard validation of emails jfv
end
