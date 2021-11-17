class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
    belongs_to :department
    has_many :reservations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
