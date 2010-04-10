class AddPhotoColumn < ActiveRecord::Migration
  def self.up
  add_column :classifieds, :content_type, :string, :default =>"image/png"
  execute 'ALTER TABLE classifieds ADD COLUMN picture LONGBLOB'
  end

  def self.down
    remove_column :classifieds, :content_type
    remove_column :classifieds, :picture
  end
end
