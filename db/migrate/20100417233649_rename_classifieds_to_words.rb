class RenameClassifiedsToWords < ActiveRecord::Migration
  def self.up
    rename_table :classifieds, :words
  end

  def self.down
    rename_table :words, :classifieds
  end
end
