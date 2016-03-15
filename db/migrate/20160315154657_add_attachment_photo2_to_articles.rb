class AddAttachmentPhoto2ToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :photo2
    end
  end

  def self.down
    remove_attachment :articles, :photo2
  end
end
