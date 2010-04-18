class Category < ActiveRecord::Base
  has_many :words, :dependent => :nullify
  validates_uniqueness_of :name
end
