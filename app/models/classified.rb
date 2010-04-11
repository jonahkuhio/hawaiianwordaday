class Classified < ActiveRecord::Base
  #validation of records jfv
  belongs_to :category
  belongs_to :user
  validates_presence_of :title, :message => "cannot be blank. Make your title descriptive"
  validates_presence_of :location
  validates_presence_of :description
  
  

  #validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  # cryptic code above is standard validation of emails jfv
end
