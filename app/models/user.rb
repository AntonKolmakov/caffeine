class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable

  validates :full_name, :email, presence: true
  validates :password_confirmation, :password, presence: { if: :password_required? }

  def to_s
    full_name
  end

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end

  protected

  def password_required?
    !persisted? || !password.blank? || !password_confirmation.blank?
  end
end
