class Category < ActiveRecord::Base
  has_and_belongs_to_many :articles

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


end
