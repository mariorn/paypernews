class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :transactions
  has_many :articles, through: :transactions
  
  validates :email, uniqueness: {case_sensitive: false ,message: "This email is already registered"}
  validates :email , presence: true

  validates :name, length: { in: 2..12 , message: " between 2 and 12 characters"}
  validates :name, format: {with: /\A[a-zA-ZÑñ0-9\ ]+\z/ }

  def find_by_email(email)
    User.where(email: email).first
  end

end
