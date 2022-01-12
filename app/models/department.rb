class Department < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true

  has_many :seats
  has_many :users
end
