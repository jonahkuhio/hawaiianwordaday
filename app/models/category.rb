class Category < ActiveRecord::Base
  has_many :classifieds, :dependent => :nullify
  validates_uniqueness_of :name
end
