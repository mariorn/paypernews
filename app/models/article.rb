class Article < ActiveRecord::Base
  has_many :transactions
  has_many :users, through: :transactions
  has_and_belongs_to_many :categories

  validates :title, presence: true
  validates :lead, presence: true
  validates :body, presence: true

  has_attached_file :photo1, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo1, content_type: /\Aimage\/.*\Z/

  has_attached_file :photo2, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo2, content_type: /\Aimage\/.*\Z/

  acts_as_taggable


  def access?(user)
    self.users.include?(user)
  end

  def increase_visits
    self.visits += 1
    self.save
  end

  def increase_score
    self.score += 1
    self.save
  end

  def owner?(user)
    self.user_id == user.id
  end

  def photo1?
    self.photo1.url == "/images/original/missing.png" ? false : true
  end

  def photo2?
    self.photo2.url == "/images/original/missing.png" ? false : true
  end

end
