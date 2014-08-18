class UserForm < ActiveRecord::Base
  has_many :fields

  validates :name, :email, presence: true
  validates :email, email_format: true

  accepts_nested_attributes_for :fields,
    allow_destroy: true,
    reject_if: ->(field) { field['name'].blank? }
end
