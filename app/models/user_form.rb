class UserForm < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :email, email_format: true
end
