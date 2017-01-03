class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  
  has_many :tweets

  before_create :prepend_at_symbol

  def prepend_at_symbol
  	self.username.prepend("@")
  end


end
