class User < ApplicationRecord
  include Discard::Model

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable, :trackable, validate_on_invite: true, resend_invitation: true
  belongs_to :department
  belongs_to :user_type
  has_many :reservations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :user_type_id, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_discarded
    discarded_at == nil ? "false": "true"
  end
end
