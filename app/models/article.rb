class Article < ActiveRecord::Base
  has_many :transactions
  has_many :users, through: :transactions
  has_and_belongs_to_many :categories

  validates :title, presence: true
  validates :lead, presence: true
  validates :body, presence: true


  def access?(user)
    self.users.include?(user)
  end

  def increase_visits
    self.visits += 1
    self.save
  end

  def owner?(user)
    self.user_id == user.id
  end

end
