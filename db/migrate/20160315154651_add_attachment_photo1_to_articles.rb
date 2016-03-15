class AddAttachmentPhoto1ToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :photo1
    end
  end

  def self.down
    remove_attachment :articles, :photo1
  end
end
