class CheckBox < UserFormField
  def formatted_value(field_value)
    available_value_ids = field_value.delete_if(&:blank?)
    available_values.where(id: available_value_ids).map(&:value).join(', ')
  end
end
