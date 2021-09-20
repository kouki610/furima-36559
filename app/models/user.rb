class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
  
  validates :last_name
  validates :first_name
  end
                
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
  validates :last_kananame
  validates :first_kananame
  end
         
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[A-z])(?=.*?[\d])[A-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  has_many :items
  has_many :orders
end
