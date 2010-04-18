class AddWordInContextToUnusedWords < ActiveRecord::Migration
  def self.up
    add_column :unused_words, :word_in_context, :text
  end

  def self.down
    remove_column :unused_words, :word_in_context
  end
end
