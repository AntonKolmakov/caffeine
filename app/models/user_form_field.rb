# encoding: utf-8
class UserFormField < ActiveRecord::Base
  KINDS = { check_boxes: 'Флажки', file: 'Файл',
            text: 'Текстовое поле', hidden: 'Скрытое поле',
            image: 'Изображение', password: 'Пароль', radio: 'Радиокнопки' }

  belongs_to :user_form
  has_many :available_values, class_name: 'UserFormFieldValue', dependent: :destroy

  validates :name, :field_type, presence: true
  validates :field_type, inclusion: { in: KINDS.keys.map(&:to_s) }

  accepts_nested_attributes_for :available_values
end
