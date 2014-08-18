# encoding: utf-8
class UserForm
  class Field < ActiveRecord::Base
    KINDS = { button: 'Кнопка', checkbox: 'Флажок', file: 'Файл',
              text: 'Текстовое поле', hidden: 'Скрытое поле',
              image: 'Изображение', password: 'Пароль', radio: 'Радиокнопки' }

    belongs_to :user_form

    validates :name, :field_type, presence: true
    validates :field_type, inclusion: { in: KINDS.keys.map(&:to_s) }
  end
end
