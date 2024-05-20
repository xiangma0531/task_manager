class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: { message: 'を入力してください' }
  validates :email, presence: { message: 'を入力してください' }
  validates :password, presence: { message: 'を入力してください' }

  has_many :task_headers, dependent: :destroy
end
