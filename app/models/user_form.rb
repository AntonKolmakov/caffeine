class UserForm < ActiveRecord::Base
  belongs_to :page
  has_many :user_form_fields, dependent: :destroy
  has_many :user_form_submissions

  validates :name, :email, :alias, presence: true
  validates :email, email_format: true

  accepts_nested_attributes_for :user_form_fields,
    allow_destroy: true,
    reject_if: ->(field) { field['name'].blank? }
end
