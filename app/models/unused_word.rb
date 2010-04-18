class UnusedWord < ActiveRecord::Base
  validates_presence_of :word
  validates_presence_of :definition
  validates_presence_of :word_in_context
end
