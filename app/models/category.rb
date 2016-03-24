class Category < ActiveRecord::Base
  has_and_belongs_to_many :articles

  has_attached_file :image, :default_url => '/images/original/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
