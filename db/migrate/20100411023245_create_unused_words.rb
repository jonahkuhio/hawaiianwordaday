class CreateUnusedWords < ActiveRecord::Migration
  def self.up
    create_table :unused_words do |t|
      t.string :word
      t.text :definition

      t.timestamps
    end
  end

  def self.down
    drop_table :unused_words
  end
end
