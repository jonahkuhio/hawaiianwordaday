class RenameColumnsInWords < ActiveRecord::Migration
  def self.up
    rename_column :words, :location, :definition
    rename_column :words, :description, :word_in_context
    rename_column :words, :title, :term
  end

  def self.down
  end
end
